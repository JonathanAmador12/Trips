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
            NavigationView{
                HomeView()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }.navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Text("home")
                Image(systemName: "house.circle.fill")
            }
            
            Text("Favvoritos")
                .tabItem {
                    Image(systemName: "bolt.heart.fill")
                    Text("favorites")
                }
            
            Text("recommended")
                .tabItem {
                Image(systemName: "hand.thumbsup.fill")
                Text("recommended")
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
