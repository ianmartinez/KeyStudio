//
//  Theme.swift
//  KeyStudio
//
//  Created by Ian Martinez on 3/19/19.
//  Copyright © 2019 Ian Martinez. All rights reserved.
//

import UIKit

enum KeyboardTheme {
    case dark
    case light
}

class MorseColors {
    let buttonTextColor: UIColor
    let buttonBackgroundColor: UIColor
    let buttonHighlightColor: UIColor
    let backgroundColor: UIColor
    
    init(theme: KeyboardTheme) {
        switch theme {
            case .light:
                buttonTextColor = .black
                buttonBackgroundColor = .white
                buttonHighlightColor = UIColor(white: 0.5, alpha: 1.0)
                backgroundColor = UIColor(white: 0.9, alpha: 1.0)
            case .dark:
                buttonTextColor = .white
                buttonBackgroundColor = UIColor(white: 0.1, alpha: 1.0)
                buttonHighlightColor = UIColor(white: 0.25, alpha: 1.0)
                backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        }
    }
}
