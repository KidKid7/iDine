//
//  CheckoutView.swift
//  iDine
//
//  Created by Kid Kid on 1/17/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentMethods = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentMethod = "Cash"
    
    var body: some View {
        VStack {
            Section {
                Picker("Select payment method:", selection: $paymentMethod) {
                    ForEach(paymentMethods, id: \.self) {
                        Text($0)
                    }
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
