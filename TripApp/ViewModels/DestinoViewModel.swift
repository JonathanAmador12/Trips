//
//  DestinoViewModel.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class DestinoViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    @Published var isLoading: Bool = false
    
    func getTopDestination(place: String){
        isLoading = true

        let service = ServiceDestination()
        
        service.getTopDestination(){[weak self] result in

            switch result{
            case .success(let destinations):
                DispatchQueue.main.async {
                    self?.destinations = destinations
                }
            case.failure(let error):
                print("\(error)")
            }
            
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        }
    }
}
