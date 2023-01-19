//
//  OrderView.swift
//  iDine
//
//  Created by Kid Kid on 1/16/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems(at:))
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped)
            .toolbar {
                if !order.items.isEmpty {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItems(at offSets: IndexSet) {
        order.items.remove(atOffsets: offSets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
