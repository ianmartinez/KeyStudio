//
//  AppDelegate.swift
//  KeyStudio
//
//  Created by Ian Martinez on 3/22/19.
//  Copyright © 2019 Ian Martinez. All rights reserved.
//

import UIKit

class KeyboardKey: UIButton {
    var backColor: UIColor = .black
    var highlightColor: UIColor = .darkGray
    var textColor: UIColor = .white
    
    private func styleButton() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.35
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = isHighlighted ? highlightColor : backColor
    }
}
