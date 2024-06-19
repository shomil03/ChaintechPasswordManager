//
//  CredentialModel.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import Foundation

struct Credentials : Identifiable , Hashable {
    var id : UUID
    
    let website : String
    let Username : String
    let Password : String
}

struct MockData {
    static let Credentials1 = Credentials(id: UUID(), website: "website", Username: "username", Password: "password")
    static let allCredentials = [Credentials1 , Credentials1 ,Credentials1 , Credentials1,Credentials1 , Credentials1 , Credentials1]
}
