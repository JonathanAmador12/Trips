//
//  ContentView.swift
//  TripApp
//
//  Created by JonathanA on 22/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var user: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            Text("Sign In")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.all, 25.0)
            
            VStack(alignment: .leading){
                Text("put your email")
                TextField("example@gmail.com", text: $user)
                Divider()
                    .frame(height: 10)
                    .background(Color.gray)
                    .padding(.bottom, 100)
                Text("put your password")
                SecureField("example password", text: $password)
                Divider()
                    .frame(height: 10)
                    .background(Color.gray)
                    .padding(.bottom, 100)
                
            }
            Button(action: {}) {
                Text("Enter")
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke((Color.green), lineWidth: 1.0)
                            .shadow(color: .white, radius: 6.0)
                    )
            }
            Spacer()
        }
        .padding(.horizontal, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
