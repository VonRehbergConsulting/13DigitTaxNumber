//
//  TextConstants.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 06.09.22.
//

import Foundation

struct TextConstants {
    static let mainScreenTitle = "ELSTER-Umrechnung"
    static let landPickerScreenTitle = TextConstants.landPickerPlaceholder
    
    static let numberFieldTitle = "10- oder 11-stellige Steuernummer"
    static let landPickerTitle = "Bundesland"
    static let resultTitle = "13-stellige ELSTER-Steuernummer"
    static let resultFooter = "Zum Kopieren antippen"
    
    static let numberFieldPlaceholder = "123 456 78901"
    static let landPickerPlaceholder = "Bitte auswählen"
    
    static let footerText = "Um ihre bundeseinheitliche ELSTER-Steuernummer mit 13 Stellen zu berechnen, wählen Sie zuerst ihr Bundesland und geben Sie anschließend ihre länderspezifische Steuernummer an. "
    
    static let hintForShortNumber = "Die Steuernummer sollte 10 Zeichen lang sein"
    static let hintForLongNumber = "Die Steuernummer sollte 11 Zeichen lang sein"
    static let hintForHessen = "Die Steuernummer sollte mit \"0\" beginnen und 11 Zeichen lang sein"
}
