//
//  SearchView.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchVM = SearchViewModel()
    var body: some View {
        NavigationStack{
            List{
                let data = searchVM.searchQuery.isEmpty ?
                searchVM.cities :
                searchVM.searchCity()
                
                ForEach(data, id: \.slug){ city in
                    NavigationLink(destination: DistrictsListView(city: city)){
                        Text(city.cities)
                    }
                }
            }
            .navigationTitle("Ara")
            .searchable(text: $searchVM.searchQuery, prompt: "Şehir ara")
        }
    }
}

#Preview {
    SearchView()
}
