//
//  ViewModelDestino.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class ViewModelDestino: ObservableObject {
    @Published var destinations: [Destination] = []
    @Published var isLoading: Bool = false
    
    func getDestination(place: String){
        isLoading = true

        let service = ServiceDestination()
        
        service.getDestination(){[weak self] result in

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
    
    func getDestination2(){
        isLoading = true

        let service = ServiceDestination()
        
        service.getDestination2 {[weak self] result in

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
