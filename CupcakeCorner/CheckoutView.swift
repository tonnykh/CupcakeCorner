//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Khumbongmayum Tonny on 27/06/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var oo: ObservableOrder
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    @State private var isInternetFail: Bool = false
    
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
            
            Text("Your total is \(oo.order.cost, format: .currency(code: "INR"))")
                .font(.title)
            
            Button("Place Order") {
                Task {
                    await placeOrder()
                }
            }
            .padding()
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("No Internet connection 🛜⁉️", isPresented: $isInternetFail, actions: {
            Button("OK", action: {})
        })
        .alert("Thank You!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
             Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(oo.order) else {
            print("Failed to encode order!")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodeOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodeOrder.quantity) \(Order.types[decodeOrder.type].lowercased()) cupcakes is on the way"
            showingConfirmation = true
        } catch {
            print("Checkout failed.")
            isInternetFail = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView(oo: ObservableOrder(order: Order()))
        }
    }
}
