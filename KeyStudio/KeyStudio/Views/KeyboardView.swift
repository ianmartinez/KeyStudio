//
//  KeyboardView.swift
//  KeyStudio
//
//  Created by Ian Martinez on 3/22/19.
//  Copyright © 2019 Ian Martinez. All rights reserved.
//

import UIKit

protocol KeyboardDelegate: class {
    func insertChar(_ newCharacter: String)
    func deleteCharBeforeCursor()
    func getCharBeforeCursor() -> String?
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
        insertKeyChar(key: sender as! KeyboardKey)
    }
    
    @IBAction func deletePressed() {
        delegate?.deleteCharBeforeCursor()
    }
    
    @IBAction func spacePressed() {
        delegate?.insertChar(" ")
    }
    
    func insertKeyChar(key: KeyboardKey) {
        if let keyChar = key.title(for: .normal) {
            delegate?.insertChar(keyChar)
        }
    }
}
