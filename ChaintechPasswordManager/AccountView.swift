//
//  AccountView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI
import SwiftData
import SwiftyRSA

struct AccountView: View {
    @Binding var viewmodel : ViewModel
    var credential : Credentials
    @State var showPassword = false
    @State var decryptedPassword: String = "*******"
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    VStack(alignment:.leading){
                        Text("Account type")
                            .font(.callout)
                            .foregroundStyle(Color.gray)
                            .opacity(0.7)
                        Text(credential.website)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading){
                        Text("Username/Email")
                            .font(.callout)
                            .foregroundStyle(Color.gray)
                            .opacity(0.7)
                        Text(credential.Username)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading){
                        Text("Password")
                            .font(.callout)
                            .foregroundStyle(Color.gray)
                            .opacity(0.7)
                        Text(showPassword ? decryptedPassword : "*******")
                            .font(.title)
                            .fontWeight(.semibold)
                            .animation(.easeIn , value: showPassword)
                    }
                    .padding()
                    Spacer()
                    
                    Button(action: {
                        showPassword.toggle()
                        if showPassword {
                            decryptedPassword = (try? viewmodel.decrypt(encryptedPassword: credential.Password)) ?? "Error"
                            
                        } else {
                            decryptedPassword = "*******"
                        }
                    }, label: {
                        Label("", systemImage: showPassword ? "eye.circle" : "eye.slash")
                            .labelsHidden()
                            .foregroundStyle(Color.gray)
                    })
                    .animation(.easeIn, value: showPassword)
                    .padding(.top)
                }
                
                HStack{
                    Button(action: {
                        viewmodel.selectedSheetType = .add
                    }, label: {
                        ButtonView(buttonText: "Edit", height: 50, width: 170, backColor: .black)
                            .shadow(radius: 10)
                    })
                    .padding(.leading)
                    Button(action: {
                        modelContext.delete(viewmodel.selectedCredential!)
                        viewmodel.selectedCredential = nil
                        dismiss()
                        
                    }, label: {
                        ButtonView(buttonText: "Delete", height: 50, width: 170, backColor: .red)
                    })
                    .shadow(radius: 10)
                    .padding(.trailing)
                }
            }
            .navigationTitle("Accout Details")
        }
        .onAppear{
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.systemBlue]
        }
    }
}

#Preview {
    AccountView(viewmodel: .constant(ViewModel()), credential: MockData.Credentials1)
}
