//
//  SignTab.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class SignTab : UITabBarController{
    
   // var navBar : UINavigationBar = UINavigationBar()

    @IBOutlet var back: UINavigationItem!
     var navBar: UINavigationBar = UINavigationBar()
    
    let signTabBarView = UIView()
    
    let tabBtn1 = UIButton()//
    let tabBtn2 = UIButton()
    let tabBtn3 = UIButton()

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
        super.viewDidLoad()
       // self.setNavBarToTheView()
       // back.backBarButtonItem?.style.
        
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
        
        

        
        self.tabBar.isHidden = true
        //self.tabBtn1.isSelected = false
        
        signTabBarView.frame = CGRect(x: 40, y: 0, width: self.view.frame.size.width-40, height: 80)
        signTabBarView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

        
        let widthOfOneBtn = (self.tabBar.frame.size.width-40)/3
        let heightOfOneBtn = self.signTabBarView.frame.height
        
        tabBtn3.frame = CGRect(x: 40, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        tabBtn1.frame = CGRect(x: 40+widthOfOneBtn, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        tabBtn2.frame = CGRect(x: 40+widthOfOneBtn*2, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        
        tabBtn3.setTitle("<<", for: UIControlState.normal)
        tabBtn1.setTitle("팀 검색", for: UIControlState.normal)
        tabBtn2.setTitle("팀 창단", for: UIControlState.normal)
        
        tabBtn1.tag = 0
        tabBtn2.tag = 1
        tabBtn3.tag = 2
        
        
        self.tabBtn1.isSelected = true
        setAttributeTabBarButton(btn: tabBtn1)
        setAttributeTabBarButton(btn: tabBtn2)
        setAttributeTabBarButton(btn: tabBtn3)
        
        self.view.addSubview(signTabBarView)
       // self.view.addSubview(navBar)
        
        
    }
    
    
    
    func setAttributeTabBarButton(btn : UIButton){
        
        btn.addTarget(self, action: #selector(onBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        btn.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1), for: UIControlState.normal)
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 0, alpha: 1), for: UIControlState.selected)
        self.signTabBarView.addSubview(btn)
    }
    
    func onBtnClick(sender : UIButton){
        self.tabBtn1.isSelected = false
        self.tabBtn2.isSelected = false
        self.tabBtn3.isSelected = false
        
        sender.isSelected = true
        
        self.selectedIndex = sender.tag
        
    }
    
//    func setNavBarToTheView(){
//        self.navBar.frame = CGRect(x: 0, y: 0, width: 30, height: 50)
//        self.navBar.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
//        self.view.addSubview(navBar)
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
