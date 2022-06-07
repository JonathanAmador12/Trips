//
//  ModeloDetailView.swift
//  TripApp
//
//  Created by JonathanA on 06/06/22.
//

import Foundation

struct DestinationDetailModel: Identifiable, Decodable {
    var id: Int
    var specificPlace: String
    var namePlace: String
    var description: String
    var reviews: [Review]
}

struct Review: Identifiable, Decodable {
    var id: Int
    var image: String
    var name: String
    var fecha: String
    var review: String
    var isLikeIt: Bool
    
}
