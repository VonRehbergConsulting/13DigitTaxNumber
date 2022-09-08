//
//  Land.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import Foundation

enum Land: String, CaseIterable {
    case badenWuerttemberg = "Baden Wüerttemberg"
    case berlin = "Berlin"
    case bremen = "Bremen"
    case hamburg = "Hamburg"
    case niedersachsen = "Niedersachsen"
    case rheinlandPfalz = "Rheinland Pfalz"
    case schleswigHolstein = "Schleswig Holstein"
    case bayern = "Bayern"
    case brandenburg = "Brandenburg"
    case mecklenburgVorpommern = "Mecklenburg Vorpommern"
    case saarland = "Saarland"
    case sachsenFreistaat = "Sachsen Freistaat"
    case sachsenAnhalt = "Sachsen Anhalt"
    case thueringen = "Thueringen"
    case hessen = "Hessen"
    case nordrheinWestfalen = "Nordrhein Westfalen"
    
    var requiredNumbersCount: Int {
        switch self {
        case .badenWuerttemberg, .berlin, .bremen, .hamburg, .niedersachsen, .rheinlandPfalz, .schleswigHolstein:
            return 10
        case .bayern, .brandenburg, .mecklenburgVorpommern, .saarland, .sachsenFreistaat, .sachsenAnhalt, .thueringen, .nordrheinWestfalen, .hessen:
            return 11
        }
    }
}
