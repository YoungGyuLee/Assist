//
//  BarCustom.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 27..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class BarCustom : UINavigationController{
    
   
    override func viewDidLoad() {
        self.navigationBar.frame = CGRect(x: 0, y: 0, width: 375, height: 66)
        self.navigationBar.backgroundColor = uicolorFromHex(rgbValue: 0x110000)
//        self.navigationItem.hidesBackButton = true
//        self.navigationBar.isHidden = true
//        self.navigationController?.isNavigationBarHidden = true
//        self.navigationController?.isToolbarHidden = true
        
        //self.view.addSubview(self.navBar)
        
    }
    
}
