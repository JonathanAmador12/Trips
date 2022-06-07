//
//  ViewOfNavigationLink.swift
//  TripApp
//
//  Created by JonathanA on 30/05/22.
//

import SwiftUI

//struct Detail2: Identifiable {
//    var id: Int
//    var spesificPlace: String
//    var namePlace: String
//    var description: String
//    var reviews: [Review]
//}
//
//struct Review: Identifiable {
//    var id: Int
//    var image: String
//    var nombre: String
//    var fecha: String
//    var review: String
//    var isLikeIt: Bool
//}
//
//var place: Detail2 = Detail2(
//    id: 1,
//    spesificPlace: "la patagonia",
//    namePlace: "Canada",
//    description: "La Patagonia es una región que abarca el extenso extremo austral de Sudamérica, que comparten Argentina y Chile, con la Cordillera de los Andes como su línea divisoria. El lado argentino tiene estepas áridas, praderas y desiertos, mientras que el lado chileno tiene fiordos glaciales y bosques pluviales templados. La famosa carretera argentina RN-40 pasa cerca del monte Fitz Roy y el glaciar Perito Moreno en el Parque Nacional Los Glaciares.",
//    reviews: [
//        Review(
//            id: 1,
//            image: "chemms",
//            nombre: "El Arnol",
//            fecha: "20-11-1991",
//            review: "La Patagonia es una región que abarca el extenso extremo austral de Sudamérica, que comparten Argentina y Chile, con la Cordillera de los Andes como su línea divisoria. El lado argentino tiene estepas áridas, praderas y desiertos, mientras que el lado chileno tiene fiordos glaciales y bosques pluviales templados. La famosa carretera argentina RN-40 pasa cerca del monte Fitz Roy y el glaciar Perito Moreno en el Parque Nacional Los Glaciares.",
//            isLikeIt: true
//        ),
//        Review(
//            id: 2,
//            image: "yo",
//            nombre: "El Arnol",
//            fecha: "20-11-1991",
//            review: "La Patagonia es una región que abarca el extenso extremo austral de Sudamérica, que comparten Argentina y Chile, con la Cordillera de los Andes como su línea divisoria. El lado argentino tiene estepas áridas, praderas y desiertos, mientras que el lado chileno tiene fiordos glaciales y bosques pluviales templados. La famosa carretera argentina RN-40 pasa cerca del monte Fitz Roy y el glaciar Perito Moreno en el Parque Nacional Los Glaciares.",
//            isLikeIt: true
//        )
//    ]
//)

struct ViewOfNavigationLink: View {
    
    var deatils: DestinationDetailModel
    
    var body: some View {
        ZStack {
            
            // layer one
            VStack {
                ZStack {
                    Image("islasCayman")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 400)
                        .ignoresSafeArea()
                    HStack {
                        Text("algo")
                            .background(
                                Color.gray.opacity(0.5)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                        Image(systemName: "suit.heart.fill")
                    }
                    .padding()
                    
                }
                Spacer()
            }
            
            // layer 2
            ScrollView{
                Spacer()
                    .frame(height: 350)
                VStack(alignment: .leading, spacing: 20) {
                    Text(deatils.specificPlace)
                        .foregroundColor(.white)
                        .padding(
                            EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
                        )
                        .background(
                            Color.green.opacity(0.8)
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                        )
                    Text(deatils.namePlace)
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("description")
                        .font(.headline)
                    Text(deatils.description)
                        .foregroundColor(.gray)
                    Text("Review")
                        .font(.headline)
                        .bold()
                    ForEach(deatils.reviews) { review in
                        HStack(spacing: 16){
                            VStack {
                                Image(review.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                )
                                Spacer()
                            }
                                
                            VStack(alignment: .leading, spacing: 20){
                                Text(review.name)
                                
                                Text(review.fecha)
                                
                                Text(review.review)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                HStack{
                                    Image(systemName: "suit.heart")
                                    Text("likes")
                                    Spacer()
                                    Image(systemName: "arrowshape.turn.up.left")
                                    Text("atra cosa")
                                }
                            }
                            .padding()
                            .background(
                                Color.gray
                                    .opacity(0.4)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                        }
                    }
                    Image("sydney")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 400)
                }
                .padding()
                .background(Color("fondo"))
            }
        }
        .ignoresSafeArea()
    }
}



struct ViewOfNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        
        let place: DestinationDetailModel = DestinationDetailModel(
            id: 1,
            specificPlace: "algo 1",
            namePlace: "algo 2",
            description: "cool",
            reviews: [
                Review(id: 1, image: "chemms", name: "el pancho", fecha: "18-5144-4514", review: "cool", isLikeIt: true)
            ]
        )
        
        ViewOfNavigationLink(deatils: place)
    }
}
