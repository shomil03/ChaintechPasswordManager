//
//  ContentView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingsheet = false
    var body: some View {
        NavigationStack(){
            Rectangle()
                .frame(height: 0.5)
                .padding(.top)
//                .padding(.bottom , -5)
            ScrollView{
                ForEach(MockData.allCredentials , id: \.website) {credential in
                    
                    Button(action: {
                        isShowingsheet.toggle()
                    }, label: {
                     CredentialView(credentail: credential)
                    })
                    .padding(.vertical)
                    .foregroundStyle(Color.primary)
                    
                    
                    
                    .sheet(isPresented: $isShowingsheet){
                        AccountView(credential: credential)
                            .presentationDetents([.medium])
                    }
                    
                    
                }
                
            }
            .overlay(
                Button(action: {isShowingsheet.toggle()}, label: {
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
