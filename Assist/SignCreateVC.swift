//
//  SignCreateVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignCreateVC : UIViewController{
    @IBOutlet var back: UINavigationItem!
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func toMain(_ sender: Any) {
        
                        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
                        print("들어왔졍1")
                        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
                        print("들어왔졍2")
                        self.present(main, animated: true)
        
    }

    
}
