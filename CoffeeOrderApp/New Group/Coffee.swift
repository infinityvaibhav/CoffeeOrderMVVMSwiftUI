//
//  Coffee.swift
//  CoffeeOrderApp
//
//  Created by 1389028 on 04/03/21.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
