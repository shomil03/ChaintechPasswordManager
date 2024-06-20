//
//  ContentView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI

struct HomeView: View {
    enum sheetType : String , Identifiable {
        case edit , add
        var id: String { rawValue }
    }
    @State var isShowingsheet : sheetType?
    var body: some View {
        NavigationStack(){
            Rectangle()
                .frame(height: 0.5)
                .padding(.top)
            ScrollView{
                ForEach(MockData.allCredentials , id: \.website) {credential in
                    
                    Button(action: {
                        isShowingsheet = .edit
                    }, label: {
                     CredentialView(credentail: credential)
                    })
                    .padding(.vertical)
                    .foregroundStyle(Color.primary)
                    
                    
                    
                    .sheet(item:  $isShowingsheet, content: {sheet in
                        switch sheet{
                            case .edit:
                                AccountView(credential: credential)
                                    .presentationDetents([.medium])
                            case .add:
                                AddAccount()
                                    .presentationDetents([.medium])
                        }
                    })
                    
                    
                }
                
            }
            .overlay(
                Button(action: {isShowingsheet = .add}, label: {
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
}

#Preview {
    HomeView()
}
