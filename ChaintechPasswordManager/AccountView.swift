//
//  AccountView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI

struct AccountView: View {
    var credential : Credentials
    var body: some View {
        Text("Account View")
    }
}

#Preview {
    AccountView(credential: MockData.Credentials1)
}
