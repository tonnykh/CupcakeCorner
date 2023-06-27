//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Khumbongmayum Tonny on 27/06/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order = Order()
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            NavigationLink {
                
            } label: {
                Text("Check out")
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddressView(order: Order())
        }
    }
}
