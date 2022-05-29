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
    
    
    var body: some View {
        ZStack {
            // Layer 1
            Home(
                places: possiblePlaces.places,
                destination: possibleDestinations.destinations,
                imag: possibleImage.images
            )
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
