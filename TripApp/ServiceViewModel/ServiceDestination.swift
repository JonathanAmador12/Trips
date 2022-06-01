//
//  ServiceDestination.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class ServiceDestination{
    
    func getDestination(place: String, handler: @escaping (Result <[Destination], APIError>)-> Void){
        
        var result: Result<[Destination], APIError>
        
        guard let mockPath = Bundle.main.path(forResource: "MockDestinos", ofType: "json") else {
            result = .failure(.badUrl)
            return
        }
        
        do{
            let mockFileContent: String = try String(contentsOfFile: mockPath)
            
            guard let mockData = mockFileContent.data(using: .utf8) else{
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            let destinations = try JSONDecoder().decode([Destination].self, from: mockData)
            
            var destinationSelec: [Destination] = []
            
            for destination in destinations{
                
                if destination.name.contains(place){
                    destinationSelec.append(destination)
                }
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let result: Result<[Destination], APIError> = .success(destinationSelec)
                handler(result)
            }
            
        }catch{
            result = .failure(.badDecode)
        }
    }
    
    
    
    
    func getDestination2(handler: @escaping (Result <[Destination], APIError>)-> Void){
        
        var result: Result<[Destination], APIError>
        
        guard let mockPath = Bundle.main.path(forResource: "MockDestinos", ofType: "json") else {
            result = .failure(.badUrl)
            return
        }
        
        do{
            let mockFileContent: String = try String(contentsOfFile: mockPath)
            
            guard let mockData = mockFileContent.data(using: .utf8) else{
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            let destinations = try JSONDecoder().decode([Destination].self, from: mockData)
            
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                let result: Result<[Destination], APIError> = .success(destinations)
                
                handler(result)
                
            }
            
        }catch{
            result = .failure(.badDecode)
        }
    }
}
