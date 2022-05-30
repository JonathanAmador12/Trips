//
//  SearchView.swift
//  TripApp
//
//  Created by JonathanA on 29/05/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var isSearchBarActive: Bool
    
    @State var search: String = ""
    
//    var lista: [Place] = [
//        Place(id: 1, name: "jsjjsjsios"),
//        Place(id: 2, name: "hueewhrehuwhuhu"),
//        Place(id: 3, name: "weuijewjewjew"),
//        Place(id: 4, name: "holallalala"),
//        Place(id: 5, name: "555555")
//    ]
    
    @ObservedObject var viewModelDestination  = ViewModelDestino()
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("search", text: $search)
                    Spacer()
                    
                    if !(search == ""){
                        Button(action: {
                            search = ""
                        }) {
                            Image(systemName: "x.circle")
                                .foregroundColor(.black)
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.1))
                )
                Button(action: {
                    isSearchBarActive = false
                }) {
                    Text("cancel")
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 10)
            .onChange(of: search) { newValue in
                print("arnol")
            }
            .padding(2)
            ScrollView{
                DestinationView(destinations: viewModelDestination.destinations)
            }
            .onAppear{
                viewModelDestination.getDestination()
            }
            Spacer()
        }
        .frame(width: 390)
        .background(Color.white)
        .onAppear{
            // TODO: Eliminar despues de hacer una pruebas
            viewModelDestination.getDestination()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearchBarActive: .constant(false))
    }
}
