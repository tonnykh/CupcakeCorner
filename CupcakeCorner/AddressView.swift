//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Khumbongmayum Tonny on 27/06/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var oo: ObservableOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $oo.order.name)
                TextField("Street address", text: $oo.order.streetAddress)
                TextField("City", text: $oo.order.city)
                TextField("Zip", text: $oo.order.zip)
            }
            
            NavigationLink {
                CheckoutView(oo: oo)
            } label: {
                Text("Check out")
            }
            .disabled(oo.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddressView(oo: ObservableOrder(order: Order()))
        }
    }
}
