//
//  ItemDetails.swift
//  iDine
//
//  Created by Kid Kid on 1/16/23.
//

import SwiftUI

struct ItemDetails: View {
    let item: MenuItem
    @EnvironmentObject var order: Order

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: -10,
                                        leading: 10,
                                        bottom: 0,
                                        trailing: 10))
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .font(.caption)
                    .background(.black.opacity(0.7))
                    .foregroundColor(.white)
                    .offset(x: -15, y: -5)
            }
       
            Text(item.description)
                .padding(8)
                .font(.system(size: 14))
            Button("Add Item") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        // Use toolbar to fix jumping animation
        // of navigation from child to parent
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(item.name)
            }
        }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
            .environmentObject(Order())
    }
}
