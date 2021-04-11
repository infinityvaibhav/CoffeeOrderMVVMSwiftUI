//
//  CoffeeViewModel.swift
//  CoffeeOrderApp
//
//  Created by Vaibhav Upadhyay on 12/04/21.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        self.coffee.name
    }
    
    var imageURL: String {
        self.coffee.imageURL
    }
    
    var price: Double {
        self.coffee.price
    }
}
