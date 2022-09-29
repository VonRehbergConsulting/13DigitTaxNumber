//
//  Land.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import Foundation

enum Land: String, CaseIterable {
    case badenWuerttemberg = "Baden Wüerttemberg"
    case bayern = "Bayern"
    case berlin = "Berlin"
    case brandenburg = "Brandenburg"
    case bremen = "Bremen"
    case hamburg = "Hamburg"
    case hessen = "Hessen"
    case mecklenburgVorpommern = "Mecklenburg-Vorpommern"
    case niedersachsen = "Niedersachsen"
    case nordrheinWestfalen = "Nordrhein-Westfalen"
    case rheinlandPfalz = "Rheinland-Pfalz"
    case saarland = "Saarland"
    case sachsenFreistaat = "Sachsen"
    case sachsenAnhalt = "Sachsen-Anhalt"
    case schleswigHolstein = "Schleswig-Holstein"
    case thueringen = "Thueringen"
    
    var requiredNumbersCount: Int {
        switch self {
        case .badenWuerttemberg, .berlin, .bremen, .hamburg, .niedersachsen, .rheinlandPfalz, .schleswigHolstein:
            return 10
        case .bayern, .brandenburg, .mecklenburgVorpommern, .saarland, .sachsenFreistaat, .sachsenAnhalt, .thueringen, .nordrheinWestfalen, .hessen:
            return 11
        }
    }
    var hint: String {
        if self == .hessen { return TextConstants.hintForHessen }
        if requiredNumbersCount == 10 { return TextConstants.hintForShortNumber }
        return TextConstants.hintForLongNumber
    }
}
