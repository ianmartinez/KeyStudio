//
//  KeyboardViewController.swift
//  KeyStudioKeyboard
//
//  Created by Ian Martinez on 3/19/19.
//  Copyright © 2019 Ian Martinez. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var keyboardView: KeyboardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "KeyboardView", bundle: nil).instantiate(withOwner: nil, options: nil)
        keyboardView = (nib.first as! KeyboardView)
        keyboardView.delegate = self
        
        guard let inputView = inputView else {
            return
        }
        
        inputView.addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            keyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            keyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            keyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
            ])
        
        keyboardView.setNextKeyboardVisible(needsInputModeSwitchKey)
        keyboardView.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        let theme: KeyboardTheme = (textDocumentProxy.keyboardAppearance == .dark) ? .dark : .light
        keyboardView.setTheme(theme)
    }
}

extension KeyboardViewController: KeyboardDelegate {
    func insertText(_ text: String) {
        textDocumentProxy.insertText(text)
    }
    
    func deleteCharBeforeCursor() {
        textDocumentProxy.deleteBackward()
    }
}
