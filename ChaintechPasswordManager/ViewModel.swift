//
//  ViewModel.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 20/06/24.
//

import Foundation
import SwiftyRSA
import KeychainAccess

@Observable
public final class ViewModel{
    enum sheetType : String , Identifiable {
        case edit , add
        var id: String { rawValue }
    }
    var isShowingsheet = false
    var selectedSheetType : sheetType?
    var selectedCredential : Credentials?
    
    let publicKey: PublicKey
    let privateKey: PrivateKey
    
    init() {
        do {
            let keys = try generateRSAKeys()
            self.publicKey = keys.publicKey
            self.privateKey = keys.privateKey
        } catch {
            fatalError("Failed to generate RSA keys: \(error.localizedDescription)")
        }
        
    }
}
func generateRSAKeys() throws -> (publicKey: PublicKey, privateKey: PrivateKey) {
    let keyPair = try SwiftyRSA.generateRSAKeyPair(sizeInBits: 2048)
    return (keyPair.publicKey, keyPair.privateKey)
}

func saveRSAKeys(publicKey: PublicKey, privateKey: PrivateKey) throws {
    let keychain = Keychain(service: "Singh.Shomil.ChaintechPasswordManager")
    try keychain.set(publicKey.base64String(), key: "publicKey")
    try keychain.set(privateKey.base64String(), key: "privateKey")
}

func loadRSAKeys() throws -> (publicKey: PublicKey, privateKey: PrivateKey)? {
    let keychain = Keychain(service: "Singh.Shomil.ChaintechPasswordManager")
    guard let publicKeyString = try keychain.get("publicKey"),
          let privateKeyString = try keychain.get("privateKey") else {
        return nil
    }
    let publicKey = try PublicKey(base64Encoded: publicKeyString)
    let privateKey = try PrivateKey(base64Encoded: privateKeyString)
    return (publicKey, privateKey)
    }
