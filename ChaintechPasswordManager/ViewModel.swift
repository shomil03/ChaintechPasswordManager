//
//  ViewModel.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 20/06/24.
//

import Foundation
import SwiftyRSA
@Observable
public final class ViewModel{
    enum sheetType : String , Identifiable {
        case edit , add
        var id: String { rawValue }
    }
    var isShowingsheet = false
    var selectedSheetType : sheetType?
    var selectedCredential : Credentials?
    
    private(set) var publicKey: PublicKey?
    private(set) var privateKey: PrivateKey?
    
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
    // Generate key pair (usually done securely and stored)
    let keyPair = try SwiftyRSA.generateRSAKeyPair(sizeInBits: 2048)
    
    // Extract public and private keys
    let publicKey = keyPair.publicKey
    let privateKey = keyPair.privateKey
    
    return (publicKey, privateKey)
}
