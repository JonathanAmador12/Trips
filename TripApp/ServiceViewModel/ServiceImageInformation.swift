//
//  ServiceImageInformation.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class ServiceImageInformation{
    
    func getImageInformation(handler: @escaping (Result<[ImageInformation], APIError>)-> Void){
        
        var result: Result<[ImageInformation], APIError>
        
        // este el camino ose el path
        guard let mockPath = Bundle.main.path(forResource: "MockImage", ofType: "json") else {
            result = .failure(.badUrl)
            handler(result)
            return
        }
        do{
            
            let mockFileContent: String = try String(contentsOfFile: mockPath)
            
            // nesesitamos pasarlo a DATA apara que swift lo entienda
            
            guard let mockData: Data = mockFileContent.data(using: .utf8) else {
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            let images = try JSONDecoder().decode([ImageInformation].self, from: mockData)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let result: Result<[ImageInformation], APIError> = .success(images)
                handler(result)
            }
            
        }catch{
            result = .failure(.badDecode)
            handler(result)
        }
    }
}
