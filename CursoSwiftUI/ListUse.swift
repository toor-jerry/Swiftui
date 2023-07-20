//
//  ListUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 04/07/23.
//

import SwiftUI

struct Device {
    let title: String
    let image: String
}

let house = [
    Device(title: "Laptop", image: "laptopcomputer"),
    Device(title: "Mac mini", image: "macmini"),
    Device(title: "Mac Pro", image: "macpro.gen3"),
    Device(title: "Displays", image: "display.2"),
    Device(title: "Apple Tv", image: "appletv"),
]

let work = [
    Device(title: "iphone", image: "iphone"),
    Device(title: "ipad", image: "ipad"),
    Device(title: "Airpods", image: "airpods"),
    Device(title: "Apple Watch", image: "applewatch"),
]

struct ListUse: View {
    var body: some View {
        List {
            Section(header: Text("Casa")) {
                ForEach(house, id: \.title) { element in
                    Label(element.title, systemImage: element.image)
                }
            }

            Section(header: Text("Trabajo")) {
                ForEach(work, id: \.title) { element in
                    Label(element.title, systemImage: element.image)
                }
            }
            .swipeActions {
                Button(action: {

                }, label: {
                    Image(systemName: "star")
                })
                .tint(.yellow)
            }
            .swipeActions(edge: .leading) {
                Button(action: {

                }, label: {
                    Image(systemName: "trash")
                })
                .tint(.red)
            }
        }.listStyle(.sidebar)
            .refreshable {
                // action
            }
    }
}

struct ListUse_Previews: PreviewProvider {
    static var previews: some View {
        ListUse()
    }
}
