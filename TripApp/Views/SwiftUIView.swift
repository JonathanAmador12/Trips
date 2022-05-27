//
//  SwiftUIView.swift
//  TripApp
//
//  Created by JonathanA on 22/05/22.
//

import SwiftUI

struct Home: View {
    @State var selecttionPlace = 1
    @ObservedObject var possiblePlaces = PlaceViewModel()
    @ObservedObject var possibleDestinations = ViewModelDestino()
    @ObservedObject var possibleImage = ViewModelImageInformation()
    
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
                    ForEach(possiblePlaces.places) { place in
                        Button(action: {
                            selecttionPlace = place.id
                        }) {
                            Text(place.name)
                                .foregroundColor(place.id == selecttionPlace ? .red : .gray)
                                .font(place.id == selecttionPlace ? .title2 : .body)
                                .fontWeight(place.id == selecttionPlace ? .heavy : .regular)
                        }
                    }
                }
                .frame(height: 70)
            }
            .padding(.bottom, 20)
            .onAppear{
                possiblePlaces.getPlace()
            }
            
            ScrollView(.horizontal){
                HStack(spacing: 50){
                    ForEach(possibleImage.images) { imageP in
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
            .onAppear{
                possibleImage.getImage()
            }
            
            Text("Top Destination")
                .font(.title3)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal){
                if possibleDestinations.isLoading {
                    ProgressView()
                } else {
                    HStack(spacing: 40){
                        ForEach(possibleDestinations.destinations) { destino in
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
                                            .foregroundColor(.blue)
                                        Text(destino.place)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 180)
                }
            }
            .onAppear{
                possibleDestinations.getDestination()
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
