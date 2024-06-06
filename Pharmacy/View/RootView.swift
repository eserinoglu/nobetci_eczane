//
//  RootView.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import SwiftUI

struct RootView: View {
    @State private var selection  = 0
    var body: some View {
        TabView(selection: $selection){
            HomeView()
                .tabItem {
                    Label("Harita", systemImage: "map")
                }
                .tag(0)
            SearchView()
                .tabItem {
                    Label("Ara", systemImage: "magnifyingglass")
                }
                .tag(1)
        }
    }
}

#Preview {
    RootView()
}
