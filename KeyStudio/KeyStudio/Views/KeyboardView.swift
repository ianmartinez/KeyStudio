//
//  KeyboardView.swift
//  KeyStudio
//
//  Created by Ian Martinez on 3/22/19.
//  Copyright © 2019 Ian Martinez. All rights reserved.
//

import UIKit

protocol KeyboardDelegate: class {
    func insertText(_ newCharacter: String)
    func deleteCharBeforeCursor()
}

class KeyboardView: UIView {
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    weak var delegate: KeyboardDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTheme(.light)
        setNextKeyboardVisible(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTheme(.light)
        setNextKeyboardVisible(false)
    }
    
    func setNextKeyboardVisible(_ visible: Bool) {
        nextKeyboardButton.isHidden = !visible
    }
    
    func setTheme(_ theme: KeyboardTheme) {
        let themeColors = KeyboardThemeColors(theme: theme)
        backgroundColor = themeColors.keyboardBackgroundColor
        
        for view in subviews {
            if let button = view as? KeyboardKey {
                button.setTitleColor(themeColors.keyTextColor, for: [])
                button.tintColor = themeColors.keyTextColor
                
                if button == nextKeyboardButton || button == deleteButton {
                    button.backColor = themeColors.controlKeyHighlightColor
                    button.highlightColor = themeColors.controlKeyHighlightColor
                } else {
                    button.backColor = themeColors.keyHighlightColor
                    button.highlightColor = themeColors.keyHighlightColor
                }
            }
        }
    }
    
    @IBAction func helloPressed(_ sender: Any) {
        insertKeyText(key: sender as! KeyboardKey)
    }
    
    @IBAction func deletePressed() {
        delegate?.deleteCharBeforeCursor()
    }
    
    @IBAction func spacePressed() {
        delegate?.insertText(" ")
    }
    
    func insertKeyText(key: KeyboardKey) {
        if let keyText = key.title(for: .normal) {
            delegate?.insertText(keyText)
        }
    }
}
