//
//  ServiceDestination.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

class ServiceDestination {
    
    func getTopDestination(categoriId: Int, handler: @escaping (Result <[Destination], APIError>)-> Void) {
        var result: Result<[Destination], APIError>
        
        let urlString = "\(baseUrl)/destinations"
        // Descompone una url en sus componentes: schema, host, etc.
        guard var componests = URLComponents(string: urlString) else {
            result = .failure(.badUrl)
            handler(result)
            return
        }
        let params: [URLQueryItem] = [
            URLQueryItem(name: "top_destinations", value: "true"),
            URLQueryItem(name: "category_id", value: "categoriId")
        ]
        componests.queryItems = params
        
        // Re-construir la url a partir de sus componentes
        guard let url: URL = componests.url else {
            result = .failure(.badUrl)
            handler(result)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: Result<[Destination], APIError>
            
            guard let newResponse = response as? HTTPURLResponse else {
                result = .failure(.badResponse)
                handler(result)
                return
            }
            if newResponse.statusCode == 400{
                result = .failure(.badResponse)
                handler(result)
            }
            guard let jsonData = data else {
                return
            }
            guard let destinationsTop = try? JSONDecoder().decode([Destination].self, from: jsonData) else{
                result = .failure(.badDecode)
                handler(result)
                return
            }
            result = .success(destinationsTop)
            handler(result)
        }.resume()
    }

    func getDestinationsByCategoryId(categoryId: Int, handler: @escaping (Result<[Destination], APIError>)-> Void) {
        var result: Result<[Destination], APIError>
        
        // este el camino ose el path
        let urlString = "\(baseUrl)/destinations/"
        
        // we need to descompose URL
        
        guard var componets = URLComponents(string: urlString) else{
            result = .failure(.badUrl)
            handler(result)
            return
        }
        
        let param: [URLQueryItem] = [
            URLQueryItem(name: "category_id", value: String(categoryId))
        ]
        
        componets.queryItems = param
        
        guard let url: URL = componets.url else{
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
            
            guard let destinations = try? JSONDecoder().decode([Destination].self, from: jsonData) else{
                result = .failure(.badDecode)
                handler(result)
                return
            }
            
            result = .success(destinations)
            handler(result)
        }.resume()
    }
}
