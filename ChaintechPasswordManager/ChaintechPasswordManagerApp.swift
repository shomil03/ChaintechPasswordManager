//
//  ChaintechPasswordManagerApp.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI
import SwiftData
import LocalAuthentication
@main
struct ChaintechPasswordManagerApp: App {
    @State var isLocked = true
    var body: some Scene {
        
        WindowGroup {
            if isLocked{
                VStack{}
                    .onAppear(perform: authenticate)
            }
            else{
                HomeView()
            }
                
        }
        .modelContainer(for : Credentials.self)
    }
    func authenticate() {
        let context = LAContext()
        var error : NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to protect your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success , authenticationError in
                
                if success {
                    isLocked.toggle()
                }
                else{
                    authenticate()
                }
            }
        }else{
            
        }
    }
}
