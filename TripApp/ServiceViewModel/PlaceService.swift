//
//  PlaceService.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation
class ServicePlace{
    func get(handler: @escaping (Result<[Place], APIError>)->Void){
        var result: Result<[Place], APIError>
        // recordemos que un mockPath es un string
        guard let mockPath: String = Bundle.main.path(forResource: "MockPlace", ofType: "json") else {
            result = .failure(.badUrl)
            handler(result)
            return
        }
        
        do{
            // mockfilecontent es que contiene todo
            
            let mockFileContent: String = try String(contentsOfFile: mockPath)
            
            // necesitamos pasarlo data par que la maquina lo enteienda
            
            guard let mockData: Data = mockFileContent.data(using: .utf8) else {
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            let decoder = JSONDecoder()
            let places = try decoder.decode([Place].self, from: mockData)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let result: Result<[Place], APIError> = .success(places)
                handler(result)
            }
            
        } catch{
            result = .failure(.badDecode)
            handler(result)
        }
    }
}
