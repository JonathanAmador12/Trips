//
//  HomeView.swift
//  TripApp
//
//  Created by JonathanA on 28/05/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var possiblePlaces = PlaceViewModel()
    @ObservedObject var possibleDestinations = ViewModelDestino()
    @ObservedObject var possibleImage = ViewModelImageInformation()
    
    @State var isSearchBarActive: Bool = false
    
    
    var body: some View {
        ZStack {
            // Layer 1
            Home(
                places: possiblePlaces.places,
                destination: possibleDestinations.destinations,
                imag: possibleImage.images,
                isSearchBarActive: $isSearchBarActive
                
                
            )
            
            // layer 2
            if isSearchBarActive{
                SearchView(isSearchBarActive: $isSearchBarActive)
            }
        }
        .onAppear{
            possiblePlaces.getPlace()
            possibleDestinations.getDestination()
            possibleImage.getImage()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
