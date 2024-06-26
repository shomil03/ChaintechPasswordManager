//
//  CredentialView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI
//import SwiftData
struct CredentialView: View {
    let credentail : Credentials
    var body: some View {
        HStack{
            HStack(alignment:.center , spacing: 0){
                Text(credentail.website)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)
                ForEach(1..<8) {_ in
                    Image(systemName: "staroflife.fill")
                }
                .foregroundStyle(Color.gray)
                .opacity(0.7)
                .font(.caption)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .frame(height: 80)
        .overlay( RoundedRectangle(cornerRadius: 40)
            .strokeBorder(.black ,style: StrokeStyle(lineWidth: 4) ))
        .padding(.horizontal,25)
    }
}

#Preview {
    CredentialView(credentail: MockData.Credentials1)
}
