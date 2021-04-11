//
//  AddCoffeOrderView.swift
//  CoffeeOrderApp
//
//  Created by Vaibhav Upadhyay on 12/04/21.
//

import SwiftUI

struct AddCoffeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                    }
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCell(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                            
                        }
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body),
                            footer: OrderTotalView(total: addCoffeeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place Order") {
                        self.addCoffeeOrderVM.placeOrder()
                        isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCell: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 10)
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
