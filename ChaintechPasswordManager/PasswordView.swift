//
//  PasswordView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 28/06/24.
//

import SwiftUI
struct PasswordStregthView : View {
    @Binding var password : String
    @State var divider : Int = 3
    var body: some View {
        Text(PasswordStrength(divider))
            .font(.caption)
            .fontWeight(.semibold)
            .italic()
            .foregroundStyle(setColor(divider))
            .onChange(of: password, {
                divider = validatePassword(password)
                print(divider)
            })
            .animation(.spring, value: divider)
            .onAppear{
                divider = validatePassword(password)
            }
    }
    func setColor(_ number : Int) -> Color {
        if number == 1 {
            return .green
        }
        if number == 2 {
            return .yellow
        }
        return .red
    }
}
struct PasswordView: View {
    @Binding var password : String
    @State var divider : Int = 3
    var body: some View {
        Rectangle()
            .frame(width: 300/CGFloat(divider), height: 5)
            .foregroundStyle(setColor(divider))
            .onChange(of: password){
                divider = validatePassword(password)
                print(divider)
            }
            .animation(.spring, value: divider)
            .onAppear{
                divider = validatePassword(password)
            }
    }
    func setColor(_ number : Int) -> Color {
        if number == 1 {
            return .green
        }
        if number == 2 {
            return .yellow
        }
        return .red
    }
}

#Preview {
    PasswordView(password: .constant("weak!@#VERFV34"), divider: 1)
}
