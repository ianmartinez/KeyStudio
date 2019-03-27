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

class KeyboardThemeColors {
    let keyboardBackgroundColor: UIColor
    
    // Main keys
    let keyTextColor: UIColor
    let keyBackgroundColor: UIColor
    let keyHighlightColor: UIColor
    
    // Control keys (delete/next keyboard)
    let controlKeyTextColor: UIColor
    let controlKeyBackgroundColor: UIColor
    let controlKeyHighlightColor: UIColor
    
    init(theme: KeyboardTheme) {
        controlKeyTextColor = .white
        controlKeyBackgroundColor = .blue
        controlKeyHighlightColor = .white
        
        switch theme {
            case .light:
                keyTextColor = .black
                keyBackgroundColor = .white
                keyHighlightColor = UIColor(white: 0.5, alpha: 1.0)
                keyboardBackgroundColor = UIColor(white: 0.9, alpha: 1.0)
            case .dark:
                keyTextColor = .white
                keyBackgroundColor = UIColor(white: 0.1, alpha: 1.0)
                keyHighlightColor = UIColor(white: 0.25, alpha: 1.0)
                keyboardBackgroundColor = UIColor(white: 0.05, alpha: 1.0)
        }
    }
}
