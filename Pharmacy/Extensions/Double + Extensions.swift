//
//  Double + Extensions.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 28.05.2024.
//

import Foundation

extension Double {
    func formatKm() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

extension Date {
    func formatDate(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension String {
    func formatTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "d MMM HH:mm"
            return timeFormatter.string(from: date)
        }
        return ""
    }
}
