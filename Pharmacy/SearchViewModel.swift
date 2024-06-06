//
//  SearchViewModel.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var searchQuery = ""
    @Published var cities : [City] = []
    @Published var error : Error?
    
    init(){
        fetchCities()
    }
    
    func fetchCities(){
        Task{
            do{
                let url = URL(string: "https://www.nosyapi.com/apiv2/service/pharmacies-on-duty/cities?apiKey=dpgfBk9CD6BF2EQ8ExQzj5OT21Sh80OdcfNOG7iu65pkMxPeav55QHE8dhT7")!
                let request = URLRequest(url: url)
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoded = try JSONDecoder().decode(CityResponse.self, from: data)
                DispatchQueue.main.async { self.cities = decoded.data }
            } catch {
                self.error = error
            }
        }
    }
    
    func searchCity() -> [City]{
        let cities = self.cities.filter {$0.slug.contains(searchQuery.lowercased())}
        return cities
    }
    
    func pharmaciesByCity(city: String) async throws  -> [Pharmacy]{
        do{
            let url = URL(string: "https://www.nosyapi.com/apiv2/service/pharmacies-on-duty?city=\(city.lowercased())&apiKey=dpgfBk9CD6BF2EQ8ExQzj5OT21Sh80OdcfNOG7iu65pkMxPeav55QHE8dhT7")!
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(PharmacyResponse.self, from: data)
            return decoded.data
        } catch {
            throw error
        }
    }
    
}
