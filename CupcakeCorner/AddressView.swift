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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
