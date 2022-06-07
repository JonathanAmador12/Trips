//
//  DestinationDetailViewModel.swift
//  TripApp
//
//  Created by JonathanA on 06/06/22.
//

import Foundation

class DestinationDetailViewModel: ObservableObject{
    
    @Published var detail: DestinationDetailModel?
    
    func getDetails(){
        let service = DestinationDetailService()
        
        service.getDetail {[weak self] result in
            switch result{
            case .success(let deatil):
                DispatchQueue.main.async {
                    self?.detail = deatil
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
