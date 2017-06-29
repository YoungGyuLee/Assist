//
//  DataDetailEntry.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit


class DataDetailEntry : UIViewController{
    //433 442 343 352 451
    
    @IBOutlet var stg433: UIView!
    @IBOutlet var stg442: UIView!
    @IBOutlet var stg343: UIView!
    @IBOutlet var stg352: UIView!
    @IBOutlet var stg451: UIView!

    override func viewDidLoad() {
        stg433.isHidden = false
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set433(_ sender: Any) {
        stg433.isHidden = false
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set442(_ sender: Any) {
        stg433.isHidden = true
        stg442.isHidden = false
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set343(_ sender: Any) {
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = false
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set352(_ sender: Any) {
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = false
        stg451.isHidden = true
    }
    
    @IBAction func set451(_ sender: Any) {
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = false
    }
    
    
    
    
    
    
}
