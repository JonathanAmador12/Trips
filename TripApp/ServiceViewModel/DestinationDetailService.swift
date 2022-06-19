//
//  DestinationDetailService.swift
//  TripApp
//
//  Created by JonathanA on 06/06/22.
//

import Foundation

class DestinationDetailService{
    
    func getDetail(destinationId: Int, handler: @escaping (Result<DestinationDetailModel, APIError>)->Void){
        
        var result: Result<DestinationDetailModel, APIError>
        
        guard let url = URL(string: "\(baseUrl)/destinations/\(destinationId)") else{
            result = .failure(.badUrl)
            handler(result)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: Result<DestinationDetailModel, APIError>
            
            guard let newResponse = response as? HTTPURLResponse else {
                return
            }
            
            if newResponse.statusCode == 400{
                result = .failure(.badResponse)
                handler(result)
            }
            
            guard let jsonData = data else{
                return
            }
            
            do {
                let details = try JSONDecoder().decode(DestinationDetailModel.self, from: jsonData)
                result = .success(details)
                handler(result)
            } catch {
                print(error)
                result = .failure(.badDecode)
                handler(result)
            }
            
        }.resume()
        
        
        
//        do{
//            let mockFileContent: String = try String(contentsOfFile: mockPath)
//
//            guard let mockData: Data = mockFileContent.data(using: .utf8) else {
//                result = .failure(.badDecode)
//                handler(result)
//                return
//            }
//
//            let detail = try JSONDecoder().decode(DestinationDetailModel.self, from: mockData)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                let result: Result<DestinationDetailModel, APIError> = .success(detail)
//                handler(result)
//            }
//
//        }catch{
//            result = .failure(.badDecode)
//            handler(result)
//        }
        
    }
}
