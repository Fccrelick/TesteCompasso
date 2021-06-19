//
//  Event.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import Foundation

struct Event: Codable{
    let people: [People]?
    let date: Int
    let description: String
    let image: String
    let longitude: Double
    let latitude: Double
    let price: Double
    let title: String
    let id: String
}
