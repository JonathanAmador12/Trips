//
//  DestinationCategoryViewModel.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class DestinationCategoryViewModel:ObservableObject {
    @Published var destinationCategories: [DestinationCategory] = []
    
    func getDestinationCategories(){
        let service = DestinationCategoryService()
        service.get {[weak self] result in
            switch result {
            case .success(let destinationCategories):
                DispatchQueue.main.async {
                    self?.destinationCategories = destinationCategories
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
