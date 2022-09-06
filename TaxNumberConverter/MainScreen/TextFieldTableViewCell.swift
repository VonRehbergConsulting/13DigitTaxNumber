//
//  TextFieldTableViewCell.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, ReusableCell, UITextFieldDelegate {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextConstants.numberFieldPlaceholder
        textField.isEnabled = true
        textField.delegate = self
        textField.keyboardType = .numberPad
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        selectionStyle = .none
        addSubview(textField)
        textField.attachToSuperview(insets: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        let permittedCharacters = CharacterSet(charactersIn: "1234567890")
        let characterSet = CharacterSet(charactersIn: string)
        return permittedCharacters.isSuperset(of: characterSet)
    }
}
