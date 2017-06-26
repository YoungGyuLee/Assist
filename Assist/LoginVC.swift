//
//  LoginVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class LoginVC : UIViewController{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
//
//        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
//        appDelegate.window?.rootViewController = nil

        
    }
    
    override func viewWillAppear(_ animated: Bool) {

//        let objVC: SignBaseVC? = storyboard?.instantiateViewController(withIdentifier: "SignBaseVC") as! 
            
        
    }
    
    
    @IBAction func toSign(_ sender: Any) {
                        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
                        print("들어왔졍1")
                        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
                        print("들어왔졍2")
                        self.present(main, animated: true)
    }
    
    @IBAction func Sign(_ sender: Any) {
      



//

                guard let signBase = storyboard?.instantiateViewController(withIdentifier: "SignBaseVC") as? SignBaseVC else {return}
        
                navigationController?.pushViewController(signBase, animated: true)
        
        
    }
    
}
