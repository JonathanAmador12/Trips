//
//  PlaceService.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class DestinationCategoryService {
    func get(handler: @escaping (Result<[DestinationCategory], APIError>)->Void){
        var result: Result<[DestinationCategory], APIError>
        // recordemos que un mockPath es un string
        
        guard let url = URL(string: "\(baseUrl)/type_of_destinations/") else{
            result = .failure(.badUrl)
            handler(result)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: Result<[DestinationCategory], APIError>
            
            guard let newResponse = response as? HTTPURLResponse else{
                return
            }
            
            if newResponse.statusCode == 400{
                result = .failure(.badResponse)
                handler(result)
            }
            
            guard let jsonData = data else {
                return
            }
            
            guard let places = try? JSONDecoder().decode([DestinationCategory].self, from: jsonData) else{
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            result = .success(places)
            handler(result)
            
        }.resume()
        
        //        do{
        //            // mockfilecontent es que contiene todo
        //
        //            let mockFileContent: String = try String(contentsOfFile: mockPath)
        //
        //            // necesitamos pasarlo data par que la maquina lo enteienda
        //
        //            guard let mockData: Data = mockFileContent.data(using: .utf8) else {
        //                result = .failure(.badDecode)
        //                handler(result)
        //                return
        //            }
        //
        //            let decoder = JSONDecoder()
        //            let places = try decoder.decode([Place].self, from: mockData)
        //
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        //                let result: Result<[Place], APIError> = .success(places)
        //                handler(result)
        //            }
        //
        //        } catch{
        //            result = .failure(.badDecode)
        //            handler(result)
        //        }
    }
}
