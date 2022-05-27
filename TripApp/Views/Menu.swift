//
//  Menu.swift
//  TripApp
//
//  Created by JonathanA on 22/05/22.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Text("Home")
                    Image(systemName: "homekit")
                }
            
            Text("safari")
                .tabItem {
                    Text("safari")
                    Image(systemName: "safari.fill")
                }
            
            Text("Favorite")
                .tabItem {
                    Text("Favorite")
                    Image(systemName: "heart.fill")
                }
            Text("User")
                .tabItem {
                    Text("User")
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
