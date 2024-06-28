import Foundation
import SwiftyRSA
import KeychainAccess

@Observable
public final class ViewModel {
    enum sheetType: String, Identifiable {
        case edit, add
        var id: String { rawValue }
    }
    
    var isShowingsheet = false
    var selectedSheetType: sheetType?
    var decryptedPassword: String?
    var selectedCredential: Credentials? {
        didSet {
            if let credential = selectedCredential {
                do {
                    decryptedPassword = try decrypt(encryptedPassword: credential.Password)
                } catch {
                    decryptedPassword = nil
                }
            } else {
                decryptedPassword = nil
            }
        }
    }
    
    let publicKey: PublicKey
    let privateKey: PrivateKey
    
    init() {
        do {
            let keys = try ViewModel.generateOrRetrieveRSAKeys()
            self.publicKey = keys.publicKey
            self.privateKey = keys.privateKey
        } catch {
            fatalError("Failed to generate RSA keys: \(error.localizedDescription)")
        }
    }
    
    static func generateOrRetrieveRSAKeys() throws -> (publicKey: PublicKey, privateKey: PrivateKey) {
        let keychain = Keychain(service: "com.ChaintechPasswordManager.service")
        if let publicKeyString = try? keychain.get("publicKey"), let privateKeyString = try? keychain.get("privateKey") {
            let publicKey = try PublicKey(base64Encoded: publicKeyString)
            let privateKey = try PrivateKey(base64Encoded: privateKeyString)
            return (publicKey, privateKey)
        } else {
            let keyPair = try SwiftyRSA.generateRSAKeyPair(sizeInBits: 2048)
            let publicKeyString = keyPair.publicKey.base64String
            let privateKeyString = keyPair.privateKey.base64String
            try keychain.set(publicKeyString(), key: "publicKey")
            try keychain.set(privateKeyString(), key: "privateKey")
            return (keyPair.publicKey, keyPair.privateKey)
        }
    }
    
    func encrypt(password: String) throws -> String {
        let clear = try ClearMessage(string: password, using: .utf8)
        let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)
        return encrypted.base64String
    }
    
    func decrypt(encryptedPassword: String) throws -> String {
        let encrypted = try EncryptedMessage(base64Encoded: encryptedPassword)
        let clear = try encrypted.decrypted(with: privateKey, padding: .PKCS1)
        return try clear.string(encoding: .utf8)
    }
}
