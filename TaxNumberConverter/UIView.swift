//
//  UIView.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import UIKit

extension UIView {
    
    func attachToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: insets.right),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom),
        ])
    }
    
}
