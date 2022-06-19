//
//  DestinationView.swift
//  TripApp
//
//  Created by JonathanA on 30/05/22.
//

import SwiftUI

struct DestinationView: View {
    
    var destinations: [Destination]
    
    @State var idPlace: Bool = false
    
    var body: some View {
        VStack(spacing: 5){
            ForEach(destinations) { newVista in
                NavigationLink {
                    DestinationDeatil(id: newVista.id)
                } label: {
                    HStack {
                        HStack {
                            Image(systemName: "photo")
                            Text("\(newVista.name)")
                                .foregroundColor(.black)
                                .font(.title3)
                            .bold()
                        }
                        Spacer()
                    }
                }
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(
                RoundedRectangle(cornerRadius: 5)
            )
            Spacer()
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        let destinations: [Destination] = getDataListFromMockFile(fileName: "MockTopDestinations") ?? []
        NavigationView {
            DestinationView(destinations: destinations)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}
