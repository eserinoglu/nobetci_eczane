//
//  MapPharmacySheet.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 6.06.2024.
//

import SwiftUI

struct MapPharmacySheet: View {
    @Binding var selectedPharmacy : Pharmacy?
    @State private var errorAlertVisible = false
    @State private var errorMessage = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text(selectedPharmacy!.pharmacyName)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                if let distanceKm = selectedPharmacy!.distanceKm {
                    Text("\(distanceKm.formatKm()) km")
                        .font(.system(size: 20, weight: .light))
                        .foregroundStyle(.secondary)
                }
            }
            VStack(alignment: .leading, spacing: 8){
                Text(selectedPharmacy!.district)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundStyle(.primary.opacity(0.6))
                    .padding(.bottom, 6)
                Label{
                    Text(selectedPharmacy!.address)
                } icon: {
                    Image(systemName: "arrow.triangle.turn.up.right.diamond")
                        .frame(width: 24, height: 24, alignment: .leading)
                }
                if let phone = selectedPharmacy!.phone {
                    Label{
                        Text(phone)
                            .textSelection(.enabled)
                    } icon: {
                        Image(systemName: "phone")
                            .frame(width: 24, height: 24, alignment: .leading)
                    }
                }
                Spacer()
                HStack{
                    Button{
                        redirectToMaps()
                    } label : {
                        Label("Yol Tarifi", systemImage: "location.fill")
                            .padding(10)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor, in: RoundedRectangle(cornerRadius: 16))
                    }
                    Button{
                        call()
                    } label : {
                        Label("Ara", systemImage: "phone")
                            .padding(10)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.accentColor)
                            .frame(width: 100)
                            .background(.clear, in: RoundedRectangle(cornerRadius: 16))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.accentColor)
                            )
                            .opacity(selectedPharmacy!.phone == nil ?
                                     0.4 :
                                        1
                            )
                    }
                    .disabled(selectedPharmacy!.phone == nil)
                }
            }
            .font(.system(size: 15, weight: .light, design: .rounded))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .topLeading)
        .padding(20)
        .alert("Hata", isPresented: $errorAlertVisible){
            Text(errorMessage)
        }
    }
    
    private func redirectToMaps(){
        guard let pharmacy = selectedPharmacy else { return }
        let latitude = pharmacy.latitude
        let longitude = pharmacy.longitude
        
        let appleMapsURL = URL(string: "http://maps.apple.com/?daddr=\(latitude),\(longitude)")!
        let googleMapsURL = URL(string: "comgooglemaps://?daddr=\(latitude),\(longitude)&directionsmode=driving")!
        
        if UIApplication.shared.canOpenURL(appleMapsURL) {
            UIApplication.shared.open(appleMapsURL)
        } else if UIApplication.shared.canOpenURL(googleMapsURL) {
            UIApplication.shared.open(googleMapsURL)
        } else {
            errorAlertVisible = true
            errorMessage = "Telefonunuzda yol tarifini açmak için uygun bir harita uygulaması bulunamadı."
        }
    }
    
    private func call(){
        guard let pharmacy = selectedPharmacy, let phone = pharmacy.phone else { return }
        let phoneURL = URL(string: "tel:\(phone)")!
        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL)
        } else {
            errorAlertVisible = true
            errorMessage = "Bir şeyler ters gitti."
        }
    }
}
