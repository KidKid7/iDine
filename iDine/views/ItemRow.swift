//
//  ItemRow.swift
//  iDine
//
//  Created by Kid Kid on 1/16/23.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["G": .red, "V": .green, "N": .blue]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 1))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.heavy)
                    .padding(8)
                    .background(colors[restriction, default: .black])
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
