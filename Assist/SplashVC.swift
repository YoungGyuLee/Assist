//
//  SplashVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SplashVC : UIViewController{
    var delayInSeconds = 2.113
    //let ud = UserDefaults.standard
    override func viewDidLoad() {
        
        
        let jeremyGif2 = UIImage.gif(name: "splash")
        let imageView2 = UIImageView(image: jeremyGif2)
        imageView2.frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
        self.view.addSubview(imageView2)
        
       // print("여기도 들어왔쪙")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {

                guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else{return}
                
                
                self.present(loginVC, animated: false, completion: nil)

        }
        //2초 후에 이 구문 안에 함수 실행.
    }
    
    
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        let objVC: LoginVC? = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
       // let objVC: SecondViewController? = SecondViewController()
        print("얘도 들어오오오오옴")
        
        let aObjNavi = UINavigationController(rootViewController: objVC!)
        //let aObjNavi = UINavigationController(rootViewController: objVC!)
        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        aObjNavi.isNavigationBarHidden = true
        aObjNavi.isToolbarHidden = true

        
        appDelegate.window?.rootViewController = aObjNavi

    }

}
