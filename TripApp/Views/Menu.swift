//
//  Menu.swift
//  TripApp
//
//  Created by JonathanA on 22/05/22.
//

import SwiftUI

struct Menu: View {
    
    var body: some View {
        NavigationView{
            HomeView()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
