//
//  ContentView.swift
//  CoffeeOrderApp
//
//  Created by 1389028 on 03/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: viewModel.orders)
                .navigationTitle("Coffee Order")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })
                .sheet(isPresented: $showModal) {
                    AddCoffeOrderView(isPresented: self.$showModal)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension ContentView {
    func reloadOrders() {
        self.viewModel.fetchOrders()
    }
    
    func showAddCoffeeOrderView() {
        self.showModal = true
    }
}
