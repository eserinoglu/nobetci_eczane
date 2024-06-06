//
//  PharmaciesViewModel.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 28.05.2024.
//

import Foundation
import CoreLocation
import Combine

class HomeViewModel : ObservableObject {
    @Published var pharmacies : [Pharmacy] = []
    @Published var cities : [City] = []
    
    @Published var mockData: [Pharmacy] = [
        Pharmacy(
               pharmacyID: 31,
               pharmacyName: "Reşatbey Pharmacy",
               address: "Atatürk Caddesi No:10",
               city: "Adana",
               district: "Reşatbey",
               town: nil,
               directions: "Atatürk Parkı karşısında",
               phone: "+90 322-555-1111",
               phone2: "+90 322-555-2222",
               pharmacyDutyStart: "2024-06-05 08:30:00",
               pharmacyDutyEnd: "2024-06-05 20:30:00",
               latitude: 37.0017,
               longitude: 35.3213,
               distanceMt: 1500.0,
               distanceKm: 1.5
           ),
           Pharmacy(
               pharmacyID: 32,
               pharmacyName: "Çukurova Pharmacy",
               address: "Turgut Özal Bulvarı No:20",
               city: "Adana",
               district: "Çukurova",
               town: nil,
               directions: "Çukurova Üniversitesi karşısında",
               phone: "+90 322-555-3333",
               phone2: "+90 322-555-4444",
               pharmacyDutyStart: "2024-06-05 09:00:00",
               pharmacyDutyEnd: "2024-06-05 21:00:00",
               latitude: 37.0364,
               longitude: 35.3126,
               distanceMt: 2000.0,
               distanceKm: 2.0
           ),
           Pharmacy(
               pharmacyID: 33,
               pharmacyName: "Seyhan Pharmacy",
               address: "Baraj Yolu No:45",
               city: "Adana",
               district: "Seyhan",
               town: nil,
               directions: "Baraj Gölü yanı",
               phone: "+90 322-555-5555",
               phone2: "+90 322-555-6666",
               pharmacyDutyStart: "2024-06-05 08:00:00",
               pharmacyDutyEnd: "2024-06-05 22:00:00",
               latitude: 37.0009,
               longitude: 35.3211,
               distanceMt: 2500.0,
               distanceKm: 2.5
           ),
           Pharmacy(
               pharmacyID: 34,
               pharmacyName: "Yüreğir Pharmacy",
               address: "Kozan Yolu No:10",
               city: "Adana",
               district: "Yüreğir",
               town: nil,
               directions: "Yüreğir Devlet Hastanesi karşısında",
               phone: "+90 322-555-7777",
               phone2: "+90 322-555-8888",
               pharmacyDutyStart: "2024-06-05 07:30:00",
               pharmacyDutyEnd: "2024-06-05 23:00:00",
               latitude: 37.0172,
               longitude: 35.3407,
               distanceMt: 1800.0,
               distanceKm: 1.8
           ),
           Pharmacy(
               pharmacyID: 35,
               pharmacyName: "Balcalı Pharmacy",
               address: "Balcalı Mahallesi No:5",
               city: "Adana",
               district: "Balcalı",
               town: nil,
               directions: "Balcalı Hastanesi yanı",
               phone: "+90 322-555-9999",
               phone2: "+90 322-555-0000",
               pharmacyDutyStart: "2024-06-05 08:00:00",
               pharmacyDutyEnd: "2024-06-05 22:00:00",
               latitude: 37.0316,
               longitude: 35.2913,
               distanceMt: 3000.0,
               distanceKm: 3.0
           ),
           Pharmacy(
               pharmacyID: 36,
               pharmacyName: "Kurtuluş Pharmacy",
               address: "Ziyapaşa Bulvarı No:30",
               city: "Adana",
               district: "Kurtuluş",
               town: nil,
               directions: "Ziyapaşa Parkı karşısında",
               phone: "+90 322-555-1212",
               phone2: "+90 322-555-1313",
               pharmacyDutyStart: "2024-06-05 08:30:00",
               pharmacyDutyEnd: "2024-06-05 20:30:00",
               latitude: 37.0022,
               longitude: 35.3219,
               distanceMt: 1600.0,
               distanceKm: 1.6
           ),
           Pharmacy(
               pharmacyID: 37,
               pharmacyName: "Pınar Pharmacy",
               address: "Pınar Mahallesi No:22",
               city: "Adana",
               district: "Pınar",
               town: nil,
               directions: "Pınar Parkı yanı",
               phone: "+90 322-555-1414",
               phone2: "+90 322-555-1515",
               pharmacyDutyStart: "2024-06-05 09:00:00",
               pharmacyDutyEnd: "2024-06-05 21:00:00",
               latitude: 37.0134,
               longitude: 35.3445,
               distanceMt: 2100.0,
               distanceKm: 2.1
           ),
           Pharmacy(
               pharmacyID: 38,
               pharmacyName: "Gazipaşa Pharmacy",
               address: "Gazipaşa Bulvarı No:50",
               city: "Adana",
               district: "Gazipaşa",
               town: nil,
               directions: "Gazipaşa İlkokulu karşısında",
               phone: "+90 322-555-1616",
               phone2: "+90 322-555-1717",
               pharmacyDutyStart: "2024-06-05 08:00:00",
               pharmacyDutyEnd: "2024-06-05 22:00:00",
               latitude: 37.0157,
               longitude: 35.3286,
               distanceMt: 2200.0,
               distanceKm: 2.2
           ),
           Pharmacy(
               pharmacyID: 39,
               pharmacyName: "İnönü Pharmacy",
               address: "İnönü Caddesi No:18",
               city: "Adana",
               district: "İnönü",
               town: nil,
               directions: "İnönü Parkı yanı",
               phone: "+90 322-555-1818",
               phone2: "+90 322-555-1919",
               pharmacyDutyStart: "2024-06-05 08:30:00",
               pharmacyDutyEnd: "2024-06-05 20:30:00",
               latitude: 37.0005,
               longitude: 35.3268,
               distanceMt: 2300.0,
               distanceKm: 2.3
           ),
           Pharmacy(
               pharmacyID: 40,
               pharmacyName: "Belediye Pharmacy",
               address: "Belediye Caddesi No:25",
               city: "Adana",
               district: "Belediye",
               town: nil,
               directions: "Büyükşehir Belediyesi karşısında",
               phone: "+90 322-555-2020",
               phone2: "+90 322-555-2121",
               pharmacyDutyStart: "2024-06-05 07:30:00",
               pharmacyDutyEnd: "2024-06-05 23:00:00",
               latitude: 37.0071,
               longitude: 35.3257,
               distanceMt: 2400.0,
               distanceKm: 2.4
           )
        ,
        Pharmacy(
            pharmacyID: 1,
            pharmacyName: "Ankara Pharmacy",
            address: "Ataturk Bulvari No:12",
            city: "Ankara",
            district: "Cankaya",
            town: nil,
            directions: "Near Kizilay Square",
            phone: "+90 312-555-1111",
            phone2: "+90 312-555-2222",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 39.9334,
            longitude: 32.8597,
            distanceMt: 500.0,
            distanceKm: 0.5
        ),
        Pharmacy(
            pharmacyID: 2,
            pharmacyName: "Istanbul Pharmacy",
            address: "Istiklal Caddesi No:45",
            city: "Istanbul",
            district: "Beyoglu",
            town: nil,
            directions: "Near Taksim Square",
            phone: "+90 212-555-3333",
            phone2: "+90 212-555-4444",
            pharmacyDutyStart: "2024-06-05 08:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 41.0369,
            longitude: 28.9855,
            distanceMt: 700.0,
            distanceKm: 0.7
        ),
        Pharmacy(
            pharmacyID: 3,
            pharmacyName: "Izmir Pharmacy",
            address: "Cumhuriyet Bulvari No:123",
            city: "Izmir",
            district: "Konak",
            town: nil,
            directions: "Next to Konak Square",
            phone: "+90 232-555-5555",
            phone2: "+90 232-555-6666",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 38.4192,
            longitude: 27.1287,
            distanceMt: 1200.0,
            distanceKm: 1.2
        ),
        Pharmacy(
            pharmacyID: 4,
            pharmacyName: "Antalya Pharmacy",
            address: "Gulluk Caddesi No:50",
            city: "Antalya",
            district: "Muratpasa",
            town: nil,
            directions: "Opposite to MarkAntalya",
            phone: "+90 242-555-7777",
            phone2: "+90 242-555-8888",
            pharmacyDutyStart: "2024-06-05 08:30:00",
            pharmacyDutyEnd: "2024-06-05 20:30:00",
            latitude: 36.8969,
            longitude: 30.7133,
            distanceMt: 1500.0,
            distanceKm: 1.5
        ),
        Pharmacy(
            pharmacyID: 5,
            pharmacyName: "Bursa Pharmacy",
            address: "Altıparmak Caddesi No:32",
            city: "Bursa",
            district: "Osmangazi",
            town: nil,
            directions: "Near Kent Meydanı AVM",
            phone: "+90 224-555-9999",
            phone2: "+90 224-555-0000",
            pharmacyDutyStart: "2024-06-05 06:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 40.1916,
            longitude: 29.0611,
            distanceMt: 2000.0,
            distanceKm: 2.0
        ),
        // Repeat similar structure for 25 more pharmacies with different cities and districts
        Pharmacy(
            pharmacyID: 6,
            pharmacyName: "Adana Pharmacy",
            address: "Ziyapaşa Bulvarı No:78",
            city: "Adana",
            district: "Seyhan",
            town: nil,
            directions: "Near Central Park",
            phone: "+90 322-555-1111",
            phone2: "+90 322-555-2222",
            pharmacyDutyStart: "2024-06-05 18:00:00",
            pharmacyDutyEnd: "2024-06-06 08:00:00",
            latitude: 37.0014,
            longitude: 35.3213,
            distanceMt: 800.0,
            distanceKm: 0.8
        ),
        Pharmacy(
            pharmacyID: 7,
            pharmacyName: "Gaziantep Pharmacy",
            address: "Gazimuhtar Paşa Bulvarı No:5",
            city: "Gaziantep",
            district: "Şahinbey",
            town: nil,
            directions: "Opposite to Zeugma Museum",
            phone: "+90 342-555-3333",
            phone2: "+90 342-555-4444",
            pharmacyDutyStart: "2024-06-05 08:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 37.0662,
            longitude: 37.3833,
            distanceMt: 1300.0,
            distanceKm: 1.3
        ),
        Pharmacy(
            pharmacyID: 8,
            pharmacyName: "Samsun Pharmacy",
            address: "Cumhuriyet Caddesi No:15",
            city: "Samsun",
            district: "İlkadım",
            town: nil,
            directions: "Near Samsun Piazza",
            phone: "+90 362-555-5555",
            phone2: "+90 362-555-6666",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 41.2867,
            longitude: 36.33,
            distanceMt: 1400.0,
            distanceKm: 1.4
        ),
        Pharmacy(
            pharmacyID: 9,
            pharmacyName: "Kayseri Pharmacy",
            address: "Sivas Caddesi No:67",
            city: "Kayseri",
            district: "Melikgazi",
            town: nil,
            directions: "Next to Forum Kayseri",
            phone: "+90 352-555-7777",
            phone2: "+90 352-555-8888",
            pharmacyDutyStart: "2024-06-05 08:30:00",
            pharmacyDutyEnd: "2024-06-05 20:30:00",
            latitude: 38.7201,
            longitude: 35.4875,
            distanceMt: 1700.0,
            distanceKm: 1.7
        ),
        Pharmacy(
            pharmacyID: 10,
            pharmacyName: "Eskisehir Pharmacy",
            address: "Doktorlar Caddesi No:29",
            city: "Eskisehir",
            district: "Odunpazarı",
            town: nil,
            directions: "Opposite to Espark",
            phone: "+90 222-555-9999",
            phone2: "+90 222-555-0000",
            pharmacyDutyStart: "2024-06-05 06:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 39.7767,
            longitude: 30.5206,
            distanceMt: 1800.0,
            distanceKm: 1.8
        ),
        // More mock pharmacies...
        Pharmacy(
            pharmacyID: 11,
            pharmacyName: "Trabzon Pharmacy",
            address: "Maraş Caddesi No:9",
            city: "Trabzon",
            district: "Ortahisar",
            town: nil,
            directions: "Near Trabzon Meydan Park",
            phone: "+90 462-555-1111",
            phone2: "+90 462-555-2222",
            pharmacyDutyStart: "2024-06-05 18:00:00",
            pharmacyDutyEnd: "2024-06-06 08:00:00",
            latitude: 41.0015,
            longitude: 39.7168,
            distanceMt: 900.0,
            distanceKm: 0.9
        ),
        Pharmacy(
            pharmacyID: 12,
            pharmacyName: "Mersin Pharmacy",
            address: "Gazi Mustafa Kemal Bulvarı No:123",
            city: "Mersin",
            district: "Yenişehir",
            town: nil,
            directions: "Next to Forum Mersin",
            phone: "+90 324-555-3333",
            phone2: "+90 324-555-4444",
            pharmacyDutyStart: "2024-06-05 08:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 36.8121,
            longitude: 34.6415,
            distanceMt: 1600.0,
            distanceKm: 1.6
        ),
        Pharmacy(
            pharmacyID: 13,
            pharmacyName: "Malatya Pharmacy",
            address: "İnönü Caddesi No:78",
            city: "Malatya",
            district: "Battalgazi",
            town: nil,
            directions: "Near Malatya Park",
            phone: "+90 422-555-5555",
            phone2: "+90 422-555-6666",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 38.3508,
            longitude: 38.3334,
            distanceMt: 1900.0,
            distanceKm: 1.9
        ),
        Pharmacy(
            pharmacyID: 14,
            pharmacyName: "Diyarbakir Pharmacy",
            address: "Ofis Semti No:3",
            city: "Diyarbakir",
            district: "Kayapinar",
            town: nil,
            directions: "Next to Ninova Park",
            phone: "+90 412-555-7777",
            phone2: "+90 412-555-8888",
            pharmacyDutyStart: "2024-06-05 08:30:00",
            pharmacyDutyEnd: "2024-06-05 20:30:00",
            latitude: 37.9193,
            longitude: 40.2306,
            distanceMt: 2200.0,
            distanceKm: 2.2
        ),
        Pharmacy(
            pharmacyID: 15,
            pharmacyName: "Kocaeli Pharmacy",
            address: "İzmit Caddesi No:50",
            city: "Kocaeli",
            district: "İzmit",
            town: nil,
            directions: "Opposite to Outlet Center",
            phone: "+90 262-555-9999",
            phone2: "+90 262-555-0000",
            pharmacyDutyStart: "2024-06-05 06:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 40.7669,
            longitude: 29.9409,
            distanceMt: 2300.0,
            distanceKm: 2.3
        ),
        Pharmacy(
            pharmacyID: 16,
            pharmacyName: "Sakarya Pharmacy",
            address: "Atatürk Bulvarı No:20",
            city: "Sakarya",
            district: "Adapazarı",
            town: nil,
            directions: "Near Serdivan AVM",
            phone: "+90 264-555-1111",
            phone2: "+90 264-555-2222",
            pharmacyDutyStart: "2024-06-05 18:00:00",
            pharmacyDutyEnd: "2024-06-06 08:00:00",
            latitude: 40.7667,
            longitude: 30.3948,
            distanceMt: 2400.0,
            distanceKm: 2.4
        ),
        Pharmacy(
            pharmacyID: 17,
            pharmacyName: "Denizli Pharmacy",
            address: "Çınar Meydanı No:15",
            city: "Denizli",
            district: "Merkezefendi",
            town: nil,
            directions: "Near Teraspark",
            phone: "+90 258-555-3333",
            phone2: "+90 258-555-4444",
            pharmacyDutyStart: "2024-06-05 08:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 37.7765,
            longitude: 29.0864,
            distanceMt: 2500.0,
            distanceKm: 2.5
        ),
        Pharmacy(
            pharmacyID: 18,
            pharmacyName: "Balikesir Pharmacy",
            address: "Milli Kuvvetler Caddesi No:12",
            city: "Balikesir",
            district: "Altieylul",
            town: nil,
            directions: "Next to Yaylada AVM",
            phone: "+90 266-555-5555",
            phone2: "+90 266-555-6666",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 39.6484,
            longitude: 27.8826,
            distanceMt: 2600.0,
            distanceKm: 2.6
        ),
        Pharmacy(
            pharmacyID: 19,
            pharmacyName: "Manisa Pharmacy",
            address: "Ulupark Caddesi No:8",
            city: "Manisa",
            district: "Şehzadeler",
            town: nil,
            directions: "Near Magnesia AVM",
            phone: "+90 236-555-7777",
            phone2: "+90 236-555-8888",
            pharmacyDutyStart: "2024-06-05 08:30:00",
            pharmacyDutyEnd: "2024-06-05 20:30:00",
            latitude: 38.6121,
            longitude: 27.4265,
            distanceMt: 2700.0,
            distanceKm: 2.7
        ),
        Pharmacy(
            pharmacyID: 20,
            pharmacyName: "Aydin Pharmacy",
            address: "Adnan Menderes Bulvarı No:30",
            city: "Aydin",
            district: "Efeler",
            town: nil,
            directions: "Near Forum Aydın",
            phone: "+90 256-555-9999",
            phone2: "+90 256-555-0000",
            pharmacyDutyStart: "2024-06-05 06:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 37.845,
            longitude: 27.8423,
            distanceMt: 2800.0,
            distanceKm: 2.8
        ),
        Pharmacy(
            pharmacyID: 21,
            pharmacyName: "Tekirdag Pharmacy",
            address: "Süleymanpaşa Caddesi No:5",
            city: "Tekirdag",
            district: "Süleymanpaşa",
            town: nil,
            directions: "Next to Tekira AVM",
            phone: "+90 282-555-1111",
            phone2: "+90 282-555-2222",
            pharmacyDutyStart: "2024-06-05 18:00:00",
            pharmacyDutyEnd: "2024-06-06 08:00:00",
            latitude: 40.978,
            longitude: 27.5115,
            distanceMt: 2900.0,
            distanceKm: 2.9
        ),
        Pharmacy(
            pharmacyID: 22,
            pharmacyName: "Hatay Pharmacy",
            address: "Atatürk Caddesi No:45",
            city: "Hatay",
            district: "Antakya",
            town: nil,
            directions: "Near Prime Mall",
            phone: "+90 326-555-3333",
            phone2: "+90 326-555-4444",
            pharmacyDutyStart: "2024-06-05 08:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 36.2058,
            longitude: 36.1572,
            distanceMt: 3000.0,
            distanceKm: 3.0
        ),
        Pharmacy(
            pharmacyID: 23,
            pharmacyName: "Erzurum Pharmacy",
            address: "Cumhuriyet Caddesi No:10",
            city: "Erzurum",
            district: "Yakutiye",
            town: nil,
            directions: "Near Erzurum AVM",
            phone: "+90 442-555-5555",
            phone2: "+90 442-555-6666",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 39.9043,
            longitude: 41.264,
            distanceMt: 3100.0,
            distanceKm: 3.1
        ),
        Pharmacy(
            pharmacyID: 24,
            pharmacyName: "Sivas Pharmacy",
            address: "Atatürk Bulvarı No:25",
            city: "Sivas",
            district: "Merkez",
            town: nil,
            directions: "Next to Primemall Sivas",
            phone: "+90 346-555-7777",
            phone2: "+90 346-555-8888",
            pharmacyDutyStart: "2024-06-05 08:30:00",
            pharmacyDutyEnd: "2024-06-05 20:30:00",
            latitude: 39.7477,
            longitude: 37.0179,
            distanceMt: 3200.0,
            distanceKm: 3.2
        ),
        Pharmacy(
            pharmacyID: 25,
            pharmacyName: "Van Pharmacy",
            address: "Cumhuriyet Caddesi No:13",
            city: "Van",
            district: "İpekyolu",
            town: nil,
            directions: "Near Van AVM",
            phone: "+90 432-555-9999",
            phone2: "+90 432-555-0000",
            pharmacyDutyStart: "2024-06-05 06:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 38.5019,
            longitude: 43.416,
            distanceMt: 3300.0,
            distanceKm: 3.3
        ),
        Pharmacy(
            pharmacyID: 26,
            pharmacyName: "Şanlıurfa Pharmacy",
            address: "Atatürk Bulvarı No:40",
            city: "Şanlıurfa",
            district: "Eyyübiye",
            town: nil,
            directions: "Next to Piazza AVM",
            phone: "+90 414-555-1111",
            phone2: "+90 414-555-2222",
            pharmacyDutyStart: "2024-06-05 18:00:00",
            pharmacyDutyEnd: "2024-06-06 08:00:00",
            latitude: 37.1674,
            longitude: 38.7955,
            distanceMt: 3400.0,
            distanceKm: 3.4
        ),
        Pharmacy(
            pharmacyID: 27,
            pharmacyName: "Muğla Pharmacy",
            address: "Atatürk Caddesi No:55",
            city: "Muğla",
            district: "Menteşe",
            town: nil,
            directions: "Near Rüya Park",
            phone: "+90 252-555-3333",
            phone2: "+90 252-555-4444",
            pharmacyDutyStart: "2024-06-05 08:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 37.2153,
            longitude: 28.3636,
            distanceMt: 3500.0,
            distanceKm: 3.5
        ),
        Pharmacy(
            pharmacyID: 28,
            pharmacyName: "Ordu Pharmacy",
            address: "Atatürk Bulvarı No:60",
            city: "Ordu",
            district: "Altınordu",
            town: nil,
            directions: "Next to Novada AVM",
            phone: "+90 452-555-5555",
            phone2: "+90 452-555-6666",
            pharmacyDutyStart: "2024-06-05 18:30:00",
            pharmacyDutyEnd: "2024-06-06 08:30:00",
            latitude: 40.9876,
            longitude: 37.8789,
            distanceMt: 3600.0,
            distanceKm: 3.6
        ),
        Pharmacy(
            pharmacyID: 29,
            pharmacyName: "Afyonkarahisar Pharmacy",
            address: "Yeşilyurt Caddesi No:20",
            city: "Afyonkarahisar",
            district: "Merkez",
            town: nil,
            directions: "Near Park Afyon",
            phone: "+90 272-555-7777",
            phone2: "+90 272-555-8888",
            pharmacyDutyStart: "2024-06-05 08:30:00",
            pharmacyDutyEnd: "2024-06-05 20:30:00",
            latitude: 38.7637,
            longitude: 30.5403,
            distanceMt: 3700.0,
            distanceKm: 3.7
        ),
        Pharmacy(
            pharmacyID: 30,
            pharmacyName: "Elazığ Pharmacy",
            address: "Gazi Caddesi No:25",
            city: "Elazığ",
            district: "Merkez",
            town: nil,
            directions: "Next to Akgün AVM",
            phone: "+90 424-555-9999",
            phone2: "+90 424-555-0000",
            pharmacyDutyStart: "2024-06-05 06:00:00",
            pharmacyDutyEnd: "2024-06-05 22:00:00",
            latitude: 38.6743,
            longitude: 39.2232,
            distanceMt: 3800.0,
            distanceKm: 3.8
        )
    ]

    
    @Published var error : Error?
    
    private var locationManager = UserLocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    private var userLocation : CLLocation?
    
    init(){
        locationManager.$userLocation.sink { [weak self] location in
            if let location = location {
                self?.userLocation = location
                self?.fetchPharmacies(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
            self?.fetchCities()
        }
        .store(in: &cancellables)
    }
    
    func fetchPharmacies(latitude : Double, longitude : Double) {
        Task{
            do{
                let url = URL(string: "https://www.nosyapi.com/apiv2/service/pharmacies-on-duty/locations?latitude=\(latitude)&longitude=\(longitude)&apiKey=dpgfBk9CD6BF2EQ8ExQzj5OT21Sh80OdcfNOG7iu65pkMxPeav55QHE8dhT7")!
                let request = URLRequest(url: url)
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoded = try JSONDecoder().decode(PharmacyResponse.self, from: data)
                DispatchQueue.main.async { self.pharmacies = decoded.data }
            } catch {
                DispatchQueue.main.async { self.error = error }
            }
        }
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
    
    func searchCity(_ query: String) -> [City]{
        let cities = self.cities.filter {$0.slug.contains(query.lowercased())}
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

struct PharmacyResponse : Decodable {
    let data : [Pharmacy]
}

struct CityResponse : Decodable {
    let data : [City]
}

struct City : Decodable {
    let cities : String
    let slug : String
}
