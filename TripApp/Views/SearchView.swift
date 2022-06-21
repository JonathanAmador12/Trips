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
    // significa que es para manejar la memoria y pertenece al estado de la vista
    // esta propiedad va almacenar si un textField esta siendo enfocado
    @FocusState var isFocused: Bool
    
    @ObservedObject var destinationVM  = DestinoViewModel()
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("search", text: $search)
                        .focused($isFocused)
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
            .padding(.top, 1)
            .onChange(of: search) { newValue in
                destinationVM.getDestinations(searchQuery: search)
                print("arnol")
            }
            .padding(2)
            
            
            ScrollView{
                DestinationView(destinations: destinationVM.topDestinations);
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear(perform: {
            isFocused = true
        })
        .background(Color.white)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearchBarActive: .constant(false))
    }
}
