//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Khumbongmayum Tonny on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order: Order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id:\.self) { index in
                            Text(Order.types[index])
                        }
                    }
                }
                
                Section {
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity,
                        in: 1...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
