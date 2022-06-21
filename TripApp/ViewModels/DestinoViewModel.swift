//
//  DestinoViewModel.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class DestinoViewModel: ObservableObject {
    @Published var topDestinations: [Destination] = []
    @Published var destinations: [Destination] = []
    @Published var isLoading: Bool = false
    
    func getTopDestination(categoryId: Int) {
        isLoading = true

        let service = ServiceDestination()
        
        service.getTopDestination(){[weak self] result in

            switch result{
            case .success(let destinations):
                DispatchQueue.main.async {
                    self?.topDestinations = destinations
                }
            case.failure(let error):
                print("\(error)")
            }
            
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        }
    }
    
    func getDestinations(categoryId: Int) {
        let service = ServiceDestination()

        service.getDestinations(categoryId: categoryId) { [weak self] result in
            switch result{
            case .success(let destinations):
                DispatchQueue.main.async {
                    self?.destinations = destinations
                }
            case.failure(let error):
                print("\(error)")
            }
        }

    }

    func getDestinations(searchQuery: String) {
        isLoading = true

        let service = ServiceDestination()
        
        service.getTopDestination(){[weak self] result in

            switch result{
            case .success(let destinations):
                DispatchQueue.main.async {
                    self?.topDestinations = destinations
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
