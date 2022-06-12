//
//  Destination.swift
//  TripApp
//
//  Created by JonathanA on 25/05/22.
//

import Foundation

struct Destination: Identifiable, Decodable {
    var id: Int
    var name: String
    var place: String
    var imageUrl: String
}
