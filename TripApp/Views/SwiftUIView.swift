//
//  SwiftUIView.swift
//  TripApp
//
//  Created by JonathanA on 22/05/22.
//

import SwiftUI
import Kingfisher

struct Home: View {
    var destinationCategories: [DestinationCategory]
    var topDestinations: [Destination]
    var imag: [Destination]
    
    @State var selecttionPlace = 1
    
    @Binding var isSearchBarActive: Bool
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Discover")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                HStack{
                    Button(action: {
                        isSearchBarActive = true
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: {}) {
                        Image(systemName: "bell")
                    }
                }
            }
            
            ScrollView(.horizontal){
                HStack(spacing:  50){
                    ForEach(destinationCategories) { destinationCategory in
                        Button(action: {
                            selecttionPlace = destinationCategory.id
                        }) {
                            Text(destinationCategory.name)
                                .foregroundColor(destinationCategory.id == selecttionPlace ? .red : .gray)
                                .font(destinationCategory.id == selecttionPlace ? .title2 : .body)
                                .fontWeight(destinationCategory.id == selecttionPlace ? .heavy : .regular)
                        }
                    }
                }
                .frame(height: 70)
            }
            .padding(.bottom, 20)
            
            ScrollView(.horizontal){
                HStack(spacing: 50){
                    ForEach(imag) { imageP in
                        
                        NavigationLink {
                            DestinationDeatil(id: imageP.id)
                        } label: {
                            ZStack {
                                // capa zero -  fondo
                                KFImage(URL(string: imageP.imageUrl))
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
                }
                .frame(height: 400)
            }
            .padding(.bottom, 40)
            
            Text("Top Destination")
                .font(.title3)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal){
                HStack(spacing: 40) {
                    ForEach(topDestinations) { destino in
                        NavigationLink {
                            DestinationDeatil(id: destino.id)
                        } label: {
                            ZStack {
                                Color.gray.opacity(0.1)
                                    .frame(width: 280, height: 120)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    

                                HStack(spacing: 20) {
                                    KFImage(URL(string: destino.imageUrl))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 20.0)
                                        )
                                    
                                    VStack(alignment: .leading){
                                        Text(destino.name)
                                            .foregroundColor(.blue)
                                        Text(destino.location)
                                            .foregroundColor(.blue)
                                    }
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

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        let categories: [DestinationCategory] = getDataListFromMockFile(fileName: "MockDestinationCategories") ?? []
        let topDestination: [Destination] = getDataListFromMockFile(fileName: "MockTopDestinations") ?? []
        let image: [Destination] = getDataListFromMockFile(fileName: "MockImage") ?? []
        
        NavigationView {
            Home(
                destinationCategories: categories,
                topDestinations: topDestination,
                imag: image,
                isSearchBarActive: .constant(false)
            )
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
