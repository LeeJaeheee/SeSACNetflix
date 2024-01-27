//
//  UIButton+Ext.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/27/24.
//

import UIKit

extension UIButton {
    
    func configureButton(title: String, image: String, backgroundColor: UIColor, foregroundColor: UIColor) {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = foregroundColor
        config.image = UIImage(systemName: image)
        config.attributedTitle = AttributedString(title, attributes: .init([.font : UIFont.systemFont(ofSize: 13, weight: .semibold)]))
        config.imagePadding = 8
        self.configuration = config
    }
    
}
