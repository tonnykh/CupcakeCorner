//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Khumbongmayum Tonny on 27/06/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 233)
            
            Text("Your total is \(order.cost, format: .currency(code: "INR"))")
                .font(.title)
            
            Button("Place Order") {
                
            }
            .padding()
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView(order: Order())
        }
    }
}
