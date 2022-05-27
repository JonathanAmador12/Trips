//
//  APIError.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

enum APIError: Error {
    case badUrl
    case badDecode
    case badResponse
}
