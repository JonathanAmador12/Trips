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
    
    @State var selecttionPlace: Int = 0
    
    var body: some View {
        ZStack {
            // Layer 1
            Home(
                destinationCategories: destinationCategoryMV.destinationCategories,
                topDestinations: destinationVM.topDestinations,
                destinations: destinationVM.destinations,
                isSearchBarActive: $isSearchBarActive,
                selecttionPlace: $selecttionPlace
            )
            
            // layer 2
            if isSearchBarActive{
                SearchView(isSearchBarActive: $isSearchBarActive)
            }
        }
        .onAppear{
            // recibe como parametro un handler, closure porque le queremos delegar una tarea a esta funcion.
            destinationCategoryMV.getDestinationCategories { (categories: [DestinationCategory]) in
                let firstCategory = categories[0]
                selecttionPlace = firstCategory.id
            }
        }
        .onChange(of: selecttionPlace) { id in
            destinationVM.getTopDestination(categoryId: id)
            destinationVM.getDestinationsByCategoryId(categoryId: id)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
