//
//  ContentView.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 27.05.2024.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct HomeView: View {
    @StateObject var pharmaciesVM = HomeViewModel()
    @State private var selectedPharmacy : Pharmacy?
    @ObservedObject var locationManager = UserLocationManager()
    @State private var cameraPosition = MapCameraPosition.automatic
    
    var body: some View {
        NavigationStack{
            if locationManager.userLocation != nil {
                Map(position: $cameraPosition){
                    UserAnnotation()
                    ForEach(pharmaciesVM.pharmacies, id: \.pharmacyID){ pharmacy in
                        Annotation(pharmacy.pharmacyName,
                                   coordinate: CLLocationCoordinate2D(latitude: pharmacy.latitude, longitude: pharmacy.longitude)) {
                            Button{
                                withAnimation {
                                    selectedPharmacy = pharmacy
                                    updateCameraPosition()
                                }
                            } label : {
                                Image(systemName: "pill.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(.red, in: Circle())
                            }
                        }
                    }
                }
                .navigationTitle("Yakındakiler")
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
                .onAppear(perform: {
                    updateCameraPosition()
                })
            } else {
                VStack(spacing: 40){
                    Image(systemName: "location.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(Color.accentColor.gradient)
                        .shadow(radius: 10)
                        .padding(20)
                        .background(Color(uiColor: .secondarySystemBackground), in: Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.accentColor.gradient, lineWidth: 3)
                        )
                    Text("Yakınınızdaki nöbetçi eczaneleri görebilmek için konum erişim izni vermeniz gerekmektedir.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .lineSpacing(6)
                    Button(action: {locationManager.requestAccess()}){
                        Text("İzin ver")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color.accentColor.gradient, in: RoundedRectangle(cornerRadius: 16))
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 36)
                .padding(.top, 48)
                .navigationTitle("Yakındakiler")
            }
        }
    }
    
    func updateCameraPosition() {
        if let selectedPharmacy {
            let center = CLLocationCoordinate2D(latitude: selectedPharmacy.latitude - 0.0003, longitude: selectedPharmacy.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: center, span: span)
            self.cameraPosition = MapCameraPosition.region(region)
        } else {
            self.cameraPosition = .userLocation(fallback: .automatic)
        }
    }
}



#Preview {
    HomeView()
}
