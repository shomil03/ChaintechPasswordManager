//
//  AddAccount.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 20/06/24.
//

import SwiftUI

struct AddAccount: View {
    @State var accountName = ""
    @State var userName = ""
    @State var password = ""
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
            Button(action: {}, label: {
                ButtonView(buttonText: "Add new Account", height: 50, width: 300, backColor: .black)
//                    .padding(.top)
            })
        }
        .padding()
    }
}

#Preview {
    AddAccount()
}
