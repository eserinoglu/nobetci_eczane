//
//  CityMapView.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import SwiftUI
import MapKit

struct CityMapView: View {
    let pharmacies : [Pharmacy]
    @State private var selectedPharmacy : Pharmacy?
    @State private var cameraPosition : MapCameraPosition = .automatic
    var body: some View {
        Map(position: $cameraPosition){
            ForEach(pharmacies, id: \.pharmacyID){ pharmacy in
                Annotation(
                    pharmacy.pharmacyName,
                    coordinate: CLLocationCoordinate2D(latitude: pharmacy.latitude, longitude: pharmacy.longitude)) {
                        Button{
                            withAnimation {
                                self.selectedPharmacy = pharmacy
                                updateCameraPosition()
                            }
                        } label: {
                            Image(systemName: "pill.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(6)
                                .background(.red, in: Circle())
                        }
                    }
            }
        }
        .sheet(isPresented: .constant(selectedPharmacy != nil)){
            MapPharmacySheet(selectedPharmacy: $selectedPharmacy)
                .presentationBackground(.bar)
                .presentationDetents([.fraction(0.32)])
                .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.32)))
                .onDisappear(perform: {
                    withAnimation {
                        selectedPharmacy = nil
                    }
                })
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func updateCameraPosition() {
        if let selectedPharmacy {
            let center = CLLocationCoordinate2D(latitude: selectedPharmacy.latitude - 0.0015, longitude: selectedPharmacy.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: center, span: span)
            self.cameraPosition = MapCameraPosition.region(region)
        } else {
            self.cameraPosition = .userLocation(fallback: .automatic)
        }
    }
}

#Preview {
    NavigationStack{
        CityMapView(pharmacies: HomeViewModel().mockData)
    }
}
