//
//  SignBaseVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignBaseVC : UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet var back: UINavigationItem!
    var navBar: UINavigationBar = UINavigationBar()
    
    
    
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var emailText: UITextField!
    
    
    @IBOutlet var passwordText: UITextField!
    
    
    @IBOutlet var checkText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inin!!")
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)

    }
    func handleTap_mainview(_ sender: UITapGestureRecognizer?){
        print("탭탭")
        // self.idTxt.becomeFirstResponder()
        //자동으로 텍뷰에 포커스
        self.nameText.resignFirstResponder()
        //텍뷰에 포커스 아웃.
        self.emailText.resignFirstResponder()
        self.passwordText.resignFirstResponder()
        self.checkText.resignFirstResponder()
        
    }
    
    
    func goback(){
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool)  {
        print("들어오오오오옴")
        back.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "join_left_button"), style: .plain, target: self, action: #selector(goback))

        back.title = "회원가입"
       // back.title.co
        self.navBar.frame = CGRect(x: 0, y: 0, width: 375, height: 67)
        self.navBar.barTintColor = uicolorFromHex(rgbValue: 0x012A6A)
        self.navBar.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        self.navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]

        self.navigationItem.title = "회원가입"

        
        self.navBar.setItems([back], animated: false)
        self.view.addSubview(navBar)
    
    }
    
    @IBAction func back(_ sender: Any) {
         dismiss(animated: true, completion: {})
    }
    
    @IBAction func toSignDetail(_ sender: Any) {
        guard let signDetail = storyboard?.instantiateViewController(withIdentifier: "SignDetailVC") as? SignDetailVC else {return}
        
        
//        
//        let objVC: SignDetailVC? = storyboard?.instantiateViewController(withIdentifier: "SignDetailVC") as! SignDetailVC
//        //let objVC: SecondViewController? = SecondViewController()
//        print("얘도 들어오오오오옴")
//        
//        let aObjNavi = UINavigationController(rootViewController: objVC!)
//        //let aObjNavi = UINavigationController(rootViewController: objVC!)
//        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
//        // aObjNavi.isNavigationBarHidden = true
//        //aObjNavi.isToolbarHidden = true
//        
//        appDelegate.window?.rootViewController = aObjNavi
        
        navigationController?.pushViewController(signDetail, animated: true)
        
        //self.present(signDetail, animated: true, completion: {})
        
    }


    
}
