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
    @State private var addLoyaltyCard = false
    @State private var cardID = ""
    
    let tips = [10, 15, 25, 30, 0]
    @State private var tip = 15
    
    private var totalPrice: String {
        let total = order.total
        let tipAmount = total * Double(tip) / 100
        
        return (total + tipAmount).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section() {
                Picker("Select payment method", selection: $paymentMethod) {
                    ForEach(paymentMethods, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add loyalty card", isOn: $addLoyaltyCard.animation())
                if addLoyaltyCard {
                    TextField("Enter your card ID", text: $cardID)
                }
            }
            
            Section("Add a tip?") {
                Picker("In percentage", selection: $tip) {
                    ForEach(tips, id: \.self) {
                        Text("\($0)%")
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm") {
                    
                }.frame(maxWidth: .infinity)
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
