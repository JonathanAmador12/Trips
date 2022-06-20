//
//  ServiceImageInformation.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class ServiceImageInformation{
    
    func getImageInformation(handler: @escaping (Result<[Destination], APIError>)-> Void){
        
        var result: Result<[Destination], APIError>
        
        // este el camino ose el path
        guard let url = URL(string: "\(baseUrl)/destinations/") else{
            result = .failure(.badUrl)
            handler(result)
            return
        }
        
        // necesitamos haver una request
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: Result<[Destination], APIError>
            
            guard let newReponse = response as? HTTPURLResponse else{
                return
            }
            
            if newReponse.statusCode == 400{
                result = .failure(.badResponse)
                handler(result)
            }
            
            guard let jsonData = data else{
                return
            }
            
            guard let beachs = try? JSONDecoder().decode([Destination].self, from: jsonData) else{
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            result = .success(beachs)
            handler(result)
            
        }.resume()
        
        
    }
}
