//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Khumbongmayum Tonny on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var oo: ObservableOrder = ObservableOrder(order: Order())
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $oo.order.type) {
                        ForEach(Order.types.indices, id:\.self) { index in
                            Text(Order.types[index])
                        }
                    }
                    
                    Stepper("Number of cakes: \(oo.order.quantity)", value: $oo.order.quantity,
                        in: 1...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $oo.order.specialRequestEnabled)
                    
                    if oo.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $oo.order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $oo.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(oo: oo)
                    } label: {
                        Text("Delivery details")
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
