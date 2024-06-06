//
//  CityMapViewModel.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import Foundation

class CityMapViewModel : ObservableObject {
    @Published var pharmacies : [Pharmacy] = []
    @Published var error : Error?
    
    
    func getPharmaciesByCity(citySlug : String) {
        Task{
            do{
                let url = URL(string: "https://www.nosyapi.com/apiv2/service/pharmacies-on-duty?city=\(citySlug.lowercased())&apiKey=dpgfBk9CD6BF2EQ8ExQzj5OT21Sh80OdcfNOG7iu65pkMxPeav55QHE8dhT7")!
                let request = URLRequest(url: url)
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoded = try JSONDecoder().decode(PharmacyResponse.self, from: data)
                DispatchQueue.main.async { self.pharmacies = decoded.data }
            } catch {
                DispatchQueue.main.async { self.error = error }
            }
        }
    }
    
    func sortDistricts() -> [District]? {
        guard !self.pharmacies.isEmpty else { return nil }
        var districts : [District] = []
        for pharmacy in pharmacies {
            if let index = districts.firstIndex(where: {$0.name.lowercased() == pharmacy.district.lowercased()}){
                districts[index].pharmacies.append(pharmacy)
            } else {
                let district = District(name: pharmacy.district, pharmacies: [pharmacy])
                districts.append(district)
            }
        }
        return districts
    }
    
    
}

struct District : Identifiable {
    var id = UUID()
    var name : String
    var pharmacies : [Pharmacy]
}
