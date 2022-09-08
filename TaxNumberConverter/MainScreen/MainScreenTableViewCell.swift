//
//  MainScreenTableViewCell.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell, ReusableCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String?, secondaryText: String?, showIndicator: Bool) {
        var content = defaultContentConfiguration()
        content.text = text
        content.secondaryText = secondaryText
        accessoryType = showIndicator ? .disclosureIndicator : .none
        contentConfiguration = content
    }
}
