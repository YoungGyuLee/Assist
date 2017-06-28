//
//  SignSearchVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignSearchVC : UIViewController{
    
    @IBOutlet var back: UINavigationItem!
    var navBar: UINavigationBar = UINavigationBar()

    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    func goback(){
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        back.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "join_left_button"), style: .plain, target: self, action: #selector(goback))
        
        // back.title = "회원가입"
        // back.title.co
        self.navBar.frame = CGRect(x: 0, y: 0, width: 30, height: 67)
        self.navBar.barTintColor = uicolorFromHex(rgbValue: 0x012A6A)
        self.navBar.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        self.navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        //self.navigationItem.title = "회원가입"
        
        
        self.navBar.setItems([back], animated: false)
        self.view.addSubview(navBar)
    }
    @IBAction func toMain(_ sender: Any) {
        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
        print("들어왔졍1")
        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
        print("들어왔졍2")
        self.present(main, animated: true)
        //self.remove
        
    }
    
}
