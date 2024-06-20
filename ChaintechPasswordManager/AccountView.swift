//
//  AccountView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI

struct AccountView: View {
    var credential : Credentials
    
    @State var showPassword = false
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    VStack(alignment:.leading){
                        Text("Account type")
                            .font(.callout)
                            .foregroundStyle(Color.gray)
                            .opacity(0.7)
//                            .padding(.vertical ,1)
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
                        Text(showPassword ?  credential.Password : "*******")
                            .font(.title)
                            .fontWeight(.semibold)
                            .animation(.easeIn , value: showPassword)
                    }
                    .padding()
                    Spacer()
                    
                    Button(action: {showPassword.toggle()}, label: {
                        Label("", systemImage: showPassword ? "eye.circle" : "eye.slash")
                            .labelsHidden()
                            .foregroundStyle(Color.gray)
                    })
                    .animation(.easeIn, value: showPassword)
                    .padding(.top)
                }
                
                HStack{
                    Button(action: {}, label: {
                        ButtonView(buttonText: "Edit", height: 50, width: 170, backColor: .black)
                            .shadow(radius: 10)
                    })
                    .padding(.leading)
//                    Spacer()
                    Button(action: {}, label: {
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
    AccountView(credential: MockData.Credentials1)
}
