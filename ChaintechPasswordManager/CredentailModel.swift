//
//  CredentialModel.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import Foundation
import SwiftData

@Model
class Credentials {
    let id : UUID = UUID()
    var website : String = ""
    var Username : String = ""
    var Password : String = ""
    
    init(id: UUID , website : String , Username : String , Password : String) {
        self.id = id
        self.website = website
        self.Password = Password
        self.Username = Username
    }
}

struct MockData {
    static let Credentials1 = Credentials(id: UUID(), website: "website", Username: "username", Password: "password")
    static let allCredentials = [Credentials1 , Credentials1 ,Credentials1 , Credentials1,Credentials1 , Credentials1 , Credentials1]
}
