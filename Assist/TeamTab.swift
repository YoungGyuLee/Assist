//
//  TeamTab.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

import UIKit

class TeamTab : UITabBarController{


    let signTabBarView = UIView()
    
    let tabBtn1 = UIButton()//
    let tabBtn2 = UIButton()
    let tabBtn3 = UIButton()
    let tabBtn4 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        
        signTabBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 87)
        signTabBarView.backgroundColor = uicolorFromHex(rgbValue: 0x012A6A)
        
        
        
        let widthOfOneBtn = self.tabBar.frame.size.width/4
        let heightOfOneBtn = self.signTabBarView.frame.height
        
        tabBtn4.frame = CGRect(x: 17, y: 23, width: 22, height: 22)
        tabBtn1.frame = CGRect(x: 87, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        tabBtn2.frame = CGRect(x: 200, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
         tabBtn3.frame = CGRect(x: 296, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        
        //tabBtn4.setTitle("집", for: UIControlState.normal)
        tabBtn4.setBackgroundImage(#imageLiteral(resourceName: "yellow_home"), for: UIControlState.normal)
        tabBtn1.setTitle("팀 메인", for: UIControlState.normal)
        tabBtn2.setTitle("일정", for: UIControlState.normal)
        tabBtn3.setTitle("팀 멤버", for: UIControlState.normal)
        
        tabBtn1.tag = 0
        tabBtn2.tag = 1
        tabBtn3.tag = 2
        tabBtn4.tag = 3
        
        
        self.tabBtn1.isSelected = true
        setAttributeTabBarButton(btn: tabBtn1)
        setAttributeTabBarButton(btn: tabBtn2)
        setAttributeTabBarButton(btn: tabBtn3)
        setAttributeTabBarButton(btn: tabBtn4)
        
        self.view.addSubview(signTabBarView)
        
        
    }
    
    
    
    func setAttributeTabBarButton(btn : UIButton){
        
        btn.addTarget(self, action: #selector(onBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.4), for: UIControlState.normal)
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: UIControlState.selected)
        self.signTabBarView.addSubview(btn)
    }
    
    func onBtnClick(sender : UIButton){
        self.tabBtn1.isSelected = false
        self.tabBtn2.isSelected = false
        self.tabBtn3.isSelected = false
        self.tabBtn4.isSelected = false
        
        sender.isSelected = true
        
        self.selectedIndex = sender.tag
        
    }
    
    //    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
