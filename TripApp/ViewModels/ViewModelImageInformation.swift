//
//  ViewModelImageInformation.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class ViewModelImageInformation: ObservableObject{
    
    @Published var images: [Destination] = []
    
    func getImage(){
        let service = ServiceImageInformation()
        
        service.getImageInformation {[weak self] result in
            switch result{
            case .success(let images):
                DispatchQueue.main.async {
                    self?.images = images
                }
            case.failure(let error):
                print("\(error)")
            }
        }
        
    }
}
