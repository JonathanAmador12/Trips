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
    
    @ObservedObject var viewModelDestination  = ViewModelDestino()
    
    var body: some View {
        NavigationView{
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
                .padding(.top, 1)
                .onChange(of: search) { newValue in
                    viewModelDestination.getDestination(place: search)
                    print("arnol")
                }
                .padding(2)
                
                
                ScrollView{
                    DestinationView(destinations: viewModelDestination.destinations);
                }
                
                Spacer()
            }
            .background(Color.white)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearchBarActive: .constant(false))
    }
}
