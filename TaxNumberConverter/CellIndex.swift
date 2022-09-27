//
//  CellIndex.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 06.09.22.
//

import Foundation

enum CellIndex {
    case numberTextField
    case landPicker
    case result
    
    var indexPath: IndexPath {
        switch self {
        case .landPicker:
            return IndexPath(row: 0, section: 0)
        case .numberTextField:
            return IndexPath(row: 0, section: 1)
        case .result:
            return IndexPath(row: 0, section: 2)
        }
    }
}
