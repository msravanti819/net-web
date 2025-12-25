//
//  DemoView.swift
//  net-web
//
//  Created by Sravanti on 19/12/25.
//

import SwiftUI

struct DemoView: View {
    @State var isClicked = false
    @State private var email = ""
    @State var isEmail = false
    var body: some View {
        NavigationStack {
     
                TextField("email", text:  $email)
                .background(Color.gray)
            Spacer()
                TextField("email", text:  $email)
                .padding()
                .frame(maxWidth: .infinity)
            Button {
                
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.5))
                    .multilineTextAlignment(.center)
                    
            }
            
            
            }
    }
}

#Preview {
    DemoView()
}
