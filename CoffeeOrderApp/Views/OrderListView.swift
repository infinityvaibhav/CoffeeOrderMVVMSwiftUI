//
//  OrderListView.swift
//  CoffeeOrderApp
//
//  Created by 1389028 on 08/03/21.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) { order in
                OrderCell(order: order)
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        let order = Order(name: "Maggie", size: "medium", coffeeName: "Regular", total: 20.0)
        OrderListView(orders: [OrderViewModel(order: order)])
    }
}

struct OrderCell: View {
    let order: OrderViewModel
    var body: some View {
        HStack {
            Image(order.coffeeName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            
            VStack {
                Text(order.name)
                    .font(.title)
                    .padding([.bottom], 10)
                
                HStack {
                    Text(order.coffeeName)
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Text(order.size)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
