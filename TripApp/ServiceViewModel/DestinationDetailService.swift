//
//  DestinationDetailService.swift
//  TripApp
//
//  Created by JonathanA on 06/06/22.
//

import Foundation

class DestinationDetailService{
    
    func getDetail(handler: @escaping (Result<DestinationDetailModel, APIError>)->Void){
        
        var result: Result<DestinationDetailModel, APIError>
        
        
        guard let mockPath = Bundle.main.path(forResource: "MockPlaceWithReview", ofType: "json") else{
            result = .failure(.badUrl)
            handler(result)
            return
        }
        
        do{
            let mockFileContent: String = try String(contentsOfFile: mockPath)
            
            guard let mockData: Data = mockFileContent.data(using: .utf8) else {
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            let detail = try JSONDecoder().decode(DestinationDetailModel.self, from: mockData)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let result: Result<DestinationDetailModel, APIError> = .success(detail)
                handler(result)
            }
            
        }catch{
            result = .failure(.badDecode)
            handler(result)
        }
        
    }
}
