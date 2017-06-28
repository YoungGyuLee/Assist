//
//  RadioButtonCustom.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 27..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class RadioButtonCustom : UIButton{
    
    var alternateButton:Array<RadioButtonCustom>?
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }
    
    func unselectAlternateButtons(){
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:RadioButtonCustom in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton(){
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
               // self.layer.bor
                self.layer.borderColor = CGColor.typeID.
            } else {
                self.layer.borderColor = UIColor(red: 0, green: 1, blue: 1, alpha: <#T##CGFloat#>)
            }
        }
    }
    
    
    
}
