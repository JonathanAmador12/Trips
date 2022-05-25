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
    
    var destinos: [Destination]  = [
        Destination(id: 1, name: "California", place: "Haway"),
        Destination(id: 2, name: "California", place: "pata de perro"),
        Destination(id: 3, name: "California", place: "en algun lugar"),
        Destination(id: 4, name: "California", place: "Oxaca"),
        Destination(id: 5, name: "California", place: "chapas"),
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
        ImageInformation(id: 6, name: "image 2", location: "santa monica", rate: 5.0, imageUrl: "https//algo"),
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
                    ForEach(images) { imageP in
                        ZStack {
                            // capa zero -  fondo
                            Color(.green)
                                .frame(width: 300, height: 400, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            
                            // capa 1 - informaamadore_zz95a
                            VStack{
                                Spacer()
                                VStack(spacing: 20){
                                    HStack(spacing: 100){
                                        Text(imageP.name)
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            Text("\(imageP.rate, specifier: "%.2f")")
                                        }
                                    }
                                    Text(imageP.location)
                                        .padding(.trailing, 120)
                                        .padding(.bottom, 20)
                                }
                                .frame(width: 250, height: 100)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .black, radius: 5)
                                Spacer()
                                    .frame(height: 50)
                            }
                            
                        }
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
                        ZStack {
                            Text("")
                                .frame(width: 250, height: 120, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .stroke(.green, lineWidth: 1.0)
                                        .shadow(color: .green, radius: 6)
                            )
                            HStack(spacing: 20) {
                                Text("")
                                    .frame(width: 70, height: 70)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: .green, radius: 6.0)
                                VStack(alignment: .leading){
                                    Text(destino.name)
                                    Text(destino.place)
                                }
                            }
                        }
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


struct Destination: Identifiable {
    var id: Int
    var name: String
    var place: String
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
