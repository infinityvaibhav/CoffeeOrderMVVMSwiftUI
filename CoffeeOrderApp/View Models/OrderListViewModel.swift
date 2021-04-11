//
//  OrderListViewModel.swift
//  CoffeeOrderApp
//
//  Created by 1389028 on 04/03/21.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        WebServoice().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        order.name
    }
    
    var size: String {
        order.size
    }
    
    var coffeeName: String {
        order.coffeeName
    }
    
    var total: Double {
        order.total
    }
}
