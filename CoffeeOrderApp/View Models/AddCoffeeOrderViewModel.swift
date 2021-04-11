//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderApp
//
//  Created by Vaibhav Upadhyay on 11/04/21.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webService: WebServoice
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        calculateTotalPrice()
    }
 
    init() {
        self.webService = WebServoice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        webService.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let price = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return price[self.size]!
    }
}
