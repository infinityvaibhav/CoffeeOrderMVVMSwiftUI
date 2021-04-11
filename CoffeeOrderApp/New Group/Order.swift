//
//  Order.swift
//  CoffeeOrderApp
//
//  Created by 1389028 on 04/03/21.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
