//
//  mocks.swift
//  TripApp
//
//  Created by JonathanA on 13/06/22.
//

import Foundation

func getDataListFromMockFile<T>(fileName: String) -> [T]? where T: Decodable {
    let mockFileType = "json"
    // recordemos que un mockPath es un string
    guard let mockPath: String = Bundle.main.path(forResource: fileName, ofType: mockFileType) else {
        return nil
    }
    
    do{
        // mockfilecontent es que contiene todo
        let mockFileContent: String = try String(contentsOfFile: mockPath)
        
        // necesitamos pasarlo data par que la maquina lo enteienda
        guard let mockData: Data = mockFileContent.data(using: .utf8) else {
            return nil
        }

        let decoder = JSONDecoder()
        let data: [T] = try decoder.decode([T].self, from: mockData)
        
        return data
    } catch{
        return nil
    }
}
