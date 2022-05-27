//
//  PlaceViewModel.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class PlaceViewModel:ObservableObject {
    @Published var places: [Place] = []
    
    func getPlace(){
        let service = ServicePlace()
        service.get {[weak self] result in
            switch result {
            case .success(let places):
                DispatchQueue.main.async {
                    self?.places = places
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
