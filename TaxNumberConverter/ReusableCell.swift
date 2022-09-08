//
//  ReusableCell.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import Foundation
import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String { return String(describing: self) }
}
