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
    @ObservedObject var possibleImage = ViewModelImageInformation()
    
    @State var isSearchBarActive: Bool = false
    
    
    var body: some View {
        ZStack {
            // Layer 1
            Home(
                destinationCategories: destinationCategoryMV.destinationCategories,
                topDestinations: destinationVM.destinations,
                imag: possibleImage.images,
                isSearchBarActive: $isSearchBarActive
            )
            
            // layer 2
            if isSearchBarActive{
                SearchView(isSearchBarActive: $isSearchBarActive)
            }
        }
        .onAppear{
            destinationCategoryMV.getDestinationCategories()
            // TODO: Send the correct place
            destinationVM.getTopDestination(place: "")
            possibleImage.getImage()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
