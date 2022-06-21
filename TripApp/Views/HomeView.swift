//
//  HomeView.swift
//  TripApp
//
//  Created by JonathanA on 28/05/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var destinationCategoryMV = DestinationCategoryViewModel()
    @ObservedObject var destinationVM = DestinoViewModel()
    
    @State var isSearchBarActive: Bool = false
    
    
    var body: some View {
        ZStack {
            // Layer 1
            Home(
                destinationCategories: destinationCategoryMV.destinationCategories,
                topDestinations: destinationVM.topDestinations,
                destinations: destinationVM.destinations,
                isSearchBarActive: $isSearchBarActive
            )
            
            // layer 2
            if isSearchBarActive{
                SearchView(isSearchBarActive: $isSearchBarActive)
            }
        }
        .onAppear{
            // recibe como parametro un handler, closure porque le queremos delegar una tarea a esta funcion.
            destinationCategoryMV.getDestinationCategories()
            // TODO: Send the correct categoryId
            destinationVM.getTopDestination(categoryId: 1)
            destinationVM.getDestinations(categoryId: 1)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
