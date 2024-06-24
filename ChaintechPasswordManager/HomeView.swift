//
//  ContentView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI
import SwiftData
import SwiftyRSA

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
//    var credentials : [Credentials]
    @Query var credentials : [Credentials]
    @State var viewmodel = ViewModel()
    var body: some View {
        NavigationStack{
            Rectangle()
                .frame(height: 3)
                .padding(.top)
            ScrollView{
                ForEach(credentials , id: \.id) {credential in
                    
                    Button(action: {
                        viewmodel.selectedCredential = credential
                        printCredential(credential: viewmodel.selectedCredential)
                        viewmodel.selectedSheetType = .edit
                        viewmodel.isShowingsheet = true
                    }, label: {
                     CredentialView(credentail: credential)
                    })
                    .padding(.vertical)
                    .foregroundStyle(Color.primary)
                }
                .sheet(item: $viewmodel.selectedSheetType, content: {sheet in
                    switch sheet{
                        case .add:
//                            AddAccount(viewmodel: $viewmodel)
                            AddAccount(  viewmodel: $viewmodel, accountName: viewmodel.selectedCredential?.website ?? "" , userName: viewmodel.selectedCredential?.Username ?? "", password: (try? decryptPassword(viewmodel.selectedCredential?.Password ?? "Error")) ?? "")
                                .presentationDetents([.medium])
                        case .edit:
                            AccountView(viewmodel: $viewmodel, credential: viewmodel.selectedCredential ?? Credentials(id: UUID(), website: "", Username: "", Password: ""))
                                .presentationDetents([.medium])
                    }
                })
                
            }
            .frame(maxWidth: .infinity)
            .overlay(
                Button(action: {
                    viewmodel.selectedCredential = nil
                    viewmodel.selectedSheetType = .add
                    viewmodel.isShowingsheet = true
                    }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                })
                    .padding()
                    .padding(.trailing)
                ,alignment: .bottomTrailing)
            
            .navigationTitle("Password Manager")
            .preferredColorScheme(.light)
        }
    }
    func decryptPassword(_ encryptedPassword: String) throws -> String {
        let encrypted = try EncryptedMessage(base64Encoded: encryptedPassword)
        let clear = try encrypted.decrypted(with: viewmodel.privateKey, padding: .PKCS1)
        return try clear.string(encoding: .utf8)
    }
    func printCredential(credential : Credentials?) {
        print(credential?.website ?? "Na")
        print(credential?.Username ?? "Na")
        
    }
}

#Preview {
    HomeView()
}
