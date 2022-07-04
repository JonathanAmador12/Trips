//
//  DestinationCategoryViewModel.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class DestinationCategoryViewModel:ObservableObject {
    @Published var destinationCategories: [DestinationCategory] = []
    
    func getDestinationCategories(handler: @escaping ([DestinationCategory])->Void){
        let service = DestinationCategoryService()
        // Recuperar las categorias
        // Como no sabemos cuanto va a tardar, o cuado los datos van a llegar decidimos delegarle una tarea a la funcion
        // Dicha tarea se va a ejecutar una vez que ya tenemos los datos.
        service.get {[weak self] result in
            switch result {
            case .success(let destinationCategories):
                DispatchQueue.main.async {
                    self?.destinationCategories = destinationCategories
                }
                handler(destinationCategories)
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
