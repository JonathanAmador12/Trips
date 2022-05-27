//
//  ImageInformation.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

struct ImageInformation: Identifiable, Decodable {
    var id: Int
    var name: String
    var location: String
    var rate: Float
    var imageUrl: String
}
