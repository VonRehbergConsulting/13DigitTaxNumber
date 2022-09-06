//
//  NumberConverter.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import Foundation

class NumberConverter {
    
    func convert(number numberString: String, in land: Land) -> String? {
        var number = numberString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard land.requiredNumbersCount == number.count
        else { return nil }
        if land == .hessen {
            if number.removeFirst() != "0" {
                return nil
            }
        }
        
        switch land {
        case .badenWuerttemberg:
            return convertShort(number: number, prefix: "28")
        case .berlin:
            return convertShort(number: number, prefix: "11")
        case .bremen:
            return convertShort(number: number, prefix: "24")
        case .hamburg:
            return convertShort(number: number, prefix: "22")
        case .niedersachsen:
            return convertShort(number: number, prefix: "23")
        case .rheinlandPfalz:
            return convertShort(number: number, prefix: "27")
        case .schleswigHolstein:
            return convertShort(number: number, prefix: "21")
        case .bayern:
            return convertLong(number: number, prefix: "9")
        case .brandenburg, .sachsenFreistaat, .sachsenAnhalt:
            return convertLong(number: number, prefix: "3")
        case .mecklenburgVorpommern, .thueringen:
            return convertLong(number: number, prefix: "4")
        case .saarland:
            return convertLong(number: number, prefix: "1")
        case .hessen:
            return convertShort(number: number, prefix: "26")
        case .nordrheinWestfalen:
            return convertLong(number: number, prefix: "5")
        }
    }
    
    // MARK: - Private helpers
    
    private func convertShort(number: String, prefix: String) -> String {
        var number = number
        return prefix + String(number.removeFirst()) + String(number.removeFirst()) + "0" + number
    }
    
    private func convertLong(number: String, prefix: String) -> String {
        var number = number
        return prefix + String(number.removeFirst()) + String(number.removeFirst()) + String(number.removeFirst()) + "0" + number
    }
}
