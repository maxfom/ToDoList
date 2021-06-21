//
//  StandardButton.swift
//  Login App
//
//  Created by Георгий Сабанов on 11.06.2021.
//

import UIKit

class StandardButton: UIButton {
    
    enum State: String {
        case normal
        case highlighted
        case disabled
    }
    
    private var backgroundColorDict: [State : UIColor] = [:]
    private var alphaDict: [State : CGFloat] = [:]

    func setBackgroundColor(_ color: UIColor, for state: State) {
        backgroundColorDict[state] = color
    }
    
    func getBackgroundColor(for state: State) -> UIColor? {
        backgroundColorDict[state] ?? backgroundColorDict[.normal]
    }
    
    func setAlpha(_ value: CGFloat, for state: State) {
        alphaDict[state] = value
    }
    
    func getAlpha(for state: State) -> CGFloat {
        alphaDict[state] ?? alphaDict[.normal] ?? 0
    }
    
    override var isHighlighted: Bool {
        didSet {
            let defaultState: State = isEnabled ? .normal : .disabled
            backgroundColor = getBackgroundColor(for: isHighlighted ? .highlighted : defaultState)
            alpha = getAlpha(for: isHighlighted ? .highlighted : defaultState)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            let defaultState: State = isHighlighted ? .highlighted : .normal
            backgroundColor = getBackgroundColor(for: isEnabled ? defaultState : .disabled)
            alpha = getAlpha(for: isEnabled ? defaultState : .disabled)
        }
    }
    
}
