//
//  LoginVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class LoginVC : UIViewController, UITextFieldDelegate{
    var navBar: UINavigationBar = UINavigationBar()
    @IBOutlet var barItem: UINavigationItem!
    
    @IBOutlet var loginBtn: UIButton!//커스텀 로그인
    @IBOutlet var facebookBtn: UIButton!//페북 로그인
    @IBOutlet var kakoBtn: UIButton!//카카오 로그인
    @IBOutlet var signBtn: UIButton!//회원가입
    
    @IBOutlet var forgetPwd: UITextView!
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var emailImage: UIImageView!
    
    @IBOutlet var passwordimage: UIImageView!
    //var logoImage = String?
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        barItem.hidesBackButton = true
        //self.view.addSubview(barItem)
        emailText.delegate = self
        emailText.tag = 0
        
        passwordText.delegate = self
        passwordText.tag = 1
        
        
        passwordText.tintColor = uicolorFromHex(rgbValue: 0x95989A)
        emailText.tintColor = uicolorFromHex(rgbValue: 0x95989A)
        
        self.view.addSubview(self.navBar)
        
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
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //loginBtn.frame.
        loginBtn.layer.cornerRadius = 4
        facebookBtn.layer.cornerRadius = 4
        kakoBtn.layer.cornerRadius = 4
        signBtn.layer.cornerRadius = 4
        signBtn.layer.borderColor = UIColor.init(red: 0.31, green: 0.62, blue: 0.8, alpha: 1).cgColor
        signBtn.layer.borderWidth = 2
        logoImg.layer.cornerRadius = 4

        let logoimage = "login_logo"
        let emailimage = "login_id"
        let passwordimg = "login_password"
        
        
    
        self.setLogoImage(logoimg : logoimage, emailimg: emailimage, passwordimg: passwordimg)
        self.navBar.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.view.addSubview(self.navBar)
        
        
        
        
    }
    
    func setLogoImage(logoimg : String?, emailimg : String?, passwordimg : String?){
        if let logo = logoimg{
            logoImg.image = UIImage(named:logo)
            //앨범 이미지의 이름을 이용해서 이미지 띄울 예정.
        }
        if let email = emailimg{
            emailImage.image = UIImage(named:email)
            //앨범 이미지의 이름을 이용해서 이미지 띄울 예정.
        }
        if let password = passwordimg{
            passwordimage.image = UIImage(named:password)
            //앨범 이미지의 이름을 이용해서 이미지 띄울 예정.
        }
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        appDelegate.window?.rootViewController?.navigationController?.isToolbarHidden = false
        appDelegate.window?.rootViewController?.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    @IBAction func Sign(_ sender: Any) {
      
                guard let signBase = storyboard?.instantiateViewController(withIdentifier: "SignBaseVC") as? SignBaseVC else {return}
        
                navigationController?.pushViewController(signBase, animated: true)

        
    }
}
    

