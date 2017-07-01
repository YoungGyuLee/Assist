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

  
     var navBar: UINavigationBar = UINavigationBar()
    
    let signTabBarView = UIView()
    
    let tabBtn1 = UIButton()//
    let tabBtn2 = UIButton()
    let tabBtn3 = UIButton()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.isHidden = true
        
        signTabBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 67)
        signTabBarView.backgroundColor = uicolorFromHex(rgbValue: 0x012A6A)
        

        
        let widthOfOneBtn = self.tabBar.frame.size.width/3
        let heightOfOneBtn = self.signTabBarView.frame.height
        
        tabBtn3.frame = CGRect(x: 13, y:21 , width: 32, height: 32)
        tabBtn1.frame = CGRect(x: widthOfOneBtn, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        tabBtn2.frame = CGRect(x: widthOfOneBtn*2, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        
        //tabBtn3.backgroundImage.()
        //tabBtn3.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        tabBtn3.setBackgroundImage(#imageLiteral(resourceName: "left"), for: UIControlState.normal)
        
        //tabBtn3.setTitle("<<", for: UIControlState.normal)
        tabBtn1.setTitle("팀 검색", for: UIControlState.normal)
        tabBtn1.tintColor = uicolorFromHex(rgbValue: 0xffffff)
    
        tabBtn2.setTitle("팀 창단", for: UIControlState.normal)
        tabBtn1.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        
        tabBtn1.tag = 0
        tabBtn2.tag = 1
        tabBtn3.tag = 2
        
        
        self.tabBtn1.isSelected = true
        setAttributeTabBarButton(btn: tabBtn1)
        setAttributeTabBarButton(btn: tabBtn2)
        setAttributeTabBarButton(btn: tabBtn3)
        
        self.view.addSubview(signTabBarView)
        
        
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
    
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    
}
