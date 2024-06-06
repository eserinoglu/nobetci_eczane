//
//  DistrictsListView.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import SwiftUI

struct DistrictsListView: View {
    let city : City
    @ObservedObject var cityMapVM = CityMapViewModel()
    var body: some View {
        List{
            if let districts = cityMapVM.sortDistricts(){
                ForEach(districts.sorted(by: {$0.name < $1.name})){ district in
                    NavigationLink(destination: CityMapView(pharmacies: district.pharmacies)){
                        Text(district.name)
                            .badge(district.pharmacies.count)
                    }
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .navigationTitle(city.cities)
        .onAppear(perform: {
            cityMapVM.getPharmaciesByCity(citySlug: city.slug)
        })
    }
}

#Preview {
    NavigationStack{
        DistrictsListView(city: City(cities: "Adana", slug: "adana"))
    }
}
