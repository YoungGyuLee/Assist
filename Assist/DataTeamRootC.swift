//
//  DataTeamRootC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//
import UIKit

class DataTeamRootC : UIViewController{
    
    var pageIndex = 0
    
    @IBOutlet var toR1: UIView!
    @IBOutlet var toR2: UIView!
    
    @IBOutlet var toR3: UIView!
    
    @IBOutlet var toR4: UIView!
    
    override func viewDidLoad() {
        
        switch pageIndex {
        case 0:
            toR1.isHidden = false
            toR2.isHidden = true
            toR3.isHidden = true
            toR4.isHidden = true
        case 1:
            toR1.isHidden = true
            toR2.isHidden = false
            toR3.isHidden = true
            toR4.isHidden = true
        case 2:
            toR1.isHidden = true
            toR2.isHidden = true
            toR3.isHidden = false
            toR4.isHidden = true
        case 3:
            toR1.isHidden = true
            toR2.isHidden = true
            toR3.isHidden = true
            toR4.isHidden = false
        default:
            toR1.isHidden = true
            toR2.isHidden = true
            toR3.isHidden = true
            toR4.isHidden = true
        }
    }
    
    
    
    
}
