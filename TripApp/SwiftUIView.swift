//
//  SwiftUIView.swift
//  TripApp
//
//  Created by JonathanA on 22/05/22.
//

import SwiftUI

struct Home: View {
    
    var places: [Place] = [
        Place(id: 1, name: "Beacch"),
        Place(id: 2, name: "Mountain"),
        Place(id: 3, name: "Waterfalls"),
        Place(id: 4, name: "Laks")
    ]
    
    var imagePlaces: [PlaceImage] = [
        PlaceImage(id: 1, palce: "beach 1"),
        PlaceImage(id: 2, palce: "beach 2"),
        PlaceImage(id: 3, palce: "beach 3"),
        PlaceImage(id: 4, palce: "beach 3"),
        PlaceImage(id: 5, palce: "beach 3"),
        PlaceImage(id: 6, palce: "beach 3"),
        PlaceImage(id: 7, palce: "beach 3"),
        PlaceImage(id: 8, palce: "beach 3"),
        PlaceImage(id: 9, palce: "beach 3"),
        PlaceImage(id: 10, palce: "beach 3"),
    ]
    
    var destinos: [Destination]  = [
        Destination(id: 1, name: "California"),
        Destination(id: 2, name: "California"),
        Destination(id: 3, name: "California"),
        Destination(id: 4, name: "California"),
        Destination(id: 5, name: "California"),
        Destination(id: 6, name: "California"),
        Destination(id: 7, name: "California"),
        Destination(id: 8, name: "California"),
        Destination(id: 9, name: "California"),
        Destination(id: 10, name: "California"),
        Destination(id: 11, name: "California"),
        Destination(id: 12, name: "California"),
        Destination(id: 13, name: "California"),
        Destination(id: 14, name: "California"),
    ]
    
    /*
     [
        {
            "id": 1,
            "name": "los cabos"
            "location": "Miami"
            "rate": float
            "image_url": "httpslalllllll"
        }
     ]
     */
    
    var images: [ImageInformation] = [
        ImageInformation(id: 1, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 2, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 3, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 4, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 5, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 6, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 7, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 8, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 9, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
        ImageInformation(id: 10, name: "image 1", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
    ]
    
    @State var selecttionPlace = 1
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(spacing: 200){
                Text("Discover")
                    .font(.title)
                    .fontWeight(.heavy)
                HStack{
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: {}) {
                        Image(systemName: "bell")
                    }
                }
            }
            
            ScrollView(.horizontal){
                HStack(spacing:  50){
                    ForEach(places) { place in
                        Button(action: {
                            selecttionPlace = place.id
                        }) {
                            Text(place.name)
                                .foregroundColor(place.id == selecttionPlace ? .black : .gray)
                                .font(place.id == selecttionPlace ? .title2 : .body)
                                .fontWeight(place.id == selecttionPlace ? .heavy : .regular)
                        }
                    }
                }
                .frame(height: 70)
            }
            .padding(.bottom, 20)
            
            ScrollView(.horizontal){
                HStack(spacing: 50){
                    ForEach(imagePlaces) { imageP in
                        Text(imageP.palce)
                            .frame(width: 300, height: 400, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(.green, lineWidth: 1.0)
                                    .shadow(color: .green, radius: 6)
                            )
                    }
                }
                .frame(height: 400)
            }
            .padding(.bottom, 40)
            
            Text("Top Destination")
                .font(.title3)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal){
                HStack(spacing: 40){
                    ForEach(destinos) { destino in
                        Text(destino.name)
                            .frame(width: 200, height: 120, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(.green, lineWidth: 1.0)
                                    .shadow(color: .green, radius: 6)
                            )
                    }
                }
                .frame(height: 180)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct Place: Identifiable {
    var id: Int
    var name: String
}

struct PlaceImage: Identifiable {
    var id: Int
    var palce: String
}

struct Destination: Identifiable {
    var id: Int
    var name: String
}

struct ImageInformation: Identifiable {
    var id: Int
    var name: String
    var location: String
    var rate: Float
    var imageUrl: String
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
