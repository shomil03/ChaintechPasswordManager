//
//  AddAccount.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 20/06/24.
//

import SwiftUI
import SwiftData
import SwiftyRSA

struct AddAccount: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Binding var viewmodel : ViewModel
    @State var accountName : String = ""
    @State var userName : String = ""
    @State var password : String = ""
    @State var showingalert = false
        
    var body: some View {
        VStack{
            Spacer()
            TextField("Account Name", text: $accountName)
                .padding()
                .frame(height: 50)
                .overlay(Rectangle().stroke(.gray , style: StrokeStyle(lineWidth: 2)))
                .padding(.bottom)
            TextField("Username/Email", text: $userName)
                .padding()
                .frame(height: 50)
                .overlay(Rectangle().stroke(.gray , style: StrokeStyle(lineWidth: 2)))
                .padding(.bottom)
            TextField("Password", text: $password)
                .padding()
                .frame(height: 50)
                .overlay(Rectangle().stroke(.gray , style: StrokeStyle(lineWidth: 2)))
                .padding(.bottom)
            Spacer()
            Button(action: {
                if(validate()){
                    if let encryptedPassword = encryptRSA(data: password, publicKey: viewmodel.publicKey) {
                        viewmodel.selectedCredential?.website = accountName
                        viewmodel.selectedCredential?.Username = userName
                        viewmodel.selectedCredential?.Password = encryptedPassword
                        modelContext.insert(viewmodel.selectedCredential ?? Credentials(id: UUID(), website: accountName, Username: userName, Password: encryptedPassword))
                        viewmodel.selectedCredential = nil
                        dismiss()
                    }
                }
                else{
                    showingalert = true
                }
            }, label: {
                ButtonView(buttonText: "Add new Account", height: 50, width: 300, backColor: .black)
//                    .padding(.top)
            })
        }
        .alert("Error", isPresented: $showingalert, actions: {}, message: {
            Text("All fields are required")
        })
        .padding()
    }
    func validate() -> Bool{
        if(password == "" || accountName == "" || userName == "" ) {
            return false
        }
        return true
    }
    func encryptRSA(data: String, publicKey: PublicKey?) -> String? {
        guard let publicKey = publicKey else {
            print("Public key not available")
            return nil
        }
        
        do {
            let clear = try ClearMessage(string: data, using: .utf8)
            let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)
            return encrypted.base64String
        } catch {
            print("RSA encryption failed: \(error.localizedDescription)")
            return nil
        }
    }
    
}

#Preview {
    AddAccount(viewmodel: .constant(ViewModel()))
}
