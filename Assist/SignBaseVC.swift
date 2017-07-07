//
//  SignBaseVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignBaseVC : UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate{
    
    @IBOutlet var back: UINavigationItem!
    var navBar: UINavigationBar = UINavigationBar()
    
    
    
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var emailText: UITextField!
    
    
    @IBOutlet var passwordText: UITextField!
    
    
    @IBOutlet var checkText: UITextField!
    
    @IBOutlet var nextBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inin!!")
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        
        nameText.delegate = self
        nameText.tag = 0
        
        emailText.delegate = self
        emailText.tag = 1
        
        passwordText.delegate = self
        passwordText.tag = 2
        
        checkText.delegate = self
        checkText.tag = 3
        
        //틴트가 커서.
        nameText.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        emailText.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        passwordText.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        checkText.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        nextBtn.layer.cornerRadius = 4
        
        self.view.addGestureRecognizer(tap)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
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
        back.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "left"), style: .plain, target: self, action: #selector(goback))
        //back.leftBarButtonItem.

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
        guard let signTab = storyboard?.instantiateViewController(withIdentifier: "SignTabVC") as? SignTab else {return}
        let ad = UIApplication.shared.delegate as? AppDelegate
        ad?.username = gsno(nameText.text)
        ad?.email = gsno(emailText.text)
        ad?.password = gsno(passwordText.text)
        
        
//        signDetail.name = nameText.text
//        signDetail.email = emailText.text
//        signDetail.password = passwordText.text
        
        navigationController?.pushViewController(signTab, animated: true)
        
        //self.present(signDetail, animated: true, completion: {})
        
    }


    
}
