//
//  SearchTab.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class SearchTab : UITabBarController{
    
    // var navBar : UINavigationBar = UINavigationBar()
    var team : String?
    var coach : String?
    var place : String?
    
    
    var navBar: UINavigationBar = UINavigationBar()
    
    let signTabBarView = UIView()
    
    let tabBtn1 = UIButton()//
    let tabBtn2 = UIButton()
    let tabBtn3 = UIButton()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("상세 검색 들어 옴")
//        
//                guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignSearchDetail") as? SignSearchDetail else {return}
//
//        let destination = SignSearchDetail()
//        print(place)
//        
//        dvc.coach = coach
//        dvc.team = team
//        dvc.place = place
//        
//        
//        destination.coach = coach
//        destination.team = team
//        destination.place = place
        

    
//        let destination = UIStoryboardSegue.destination as! SignSearchDetail
//        destination.coachName.text = coach
//        destination.teamName.text = team
//        destination.placeName.text = place
        
       // let destination = Sto
        
        
        self.tabBar.isHidden = true
        
        signTabBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        signTabBarView.backgroundColor = uicolorFromHex(rgbValue: 0x012A6A)
        

        let widthOfOneBtn = self.tabBar.frame.size.width/3
        let heightOfOneBtn = self.signTabBarView.frame.height
        
        tabBtn3.frame = CGRect(x: 0, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        tabBtn1.frame = CGRect(x: widthOfOneBtn, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        tabBtn2.frame = CGRect(x: widthOfOneBtn*2, y: 0, width: widthOfOneBtn, height: heightOfOneBtn)
        
        //tabBtn3.setTitle("<<", for: UIControlState.normal)
        tabBtn1.setTitle("팀 검색", for: UIControlState.normal)
        tabBtn2.setTitle("팀 창단", for: UIControlState.normal)
        
        tabBtn1.tag = 0
        tabBtn2.tag = 1
        tabBtn3.tag = 2
        
        
        self.tabBtn1.isSelected = true
        setAttributeTabBarButton(btn: tabBtn1)
        setAttributeTabBarButton(btn: tabBtn2)
        setAttributeTabBarButtonback(btn: tabBtn3)
        
        self.view.addSubview(signTabBarView)
        
        
    }
    
    
    
    func setAttributeTabBarButton(btn : UIButton){
        
        btn.addTarget(self, action: #selector(onBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        btn.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1), for: UIControlState.normal)
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 0, alpha: 1), for: UIControlState.selected)
        self.signTabBarView.addSubview(btn)
    }
    
    func setAttributeTabBarButtonback(btn : UIButton){
        
        btn.addTarget(self, action: #selector(onBtnClick(sender:)), for: UIControlEvents.touchUpInside)
//        btn.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1), for: UIControlState.normal)
//        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 0, alpha: 1), for: UIControlState.selected)
        btn.setImage(#imageLiteral(resourceName: "left"), for: .reserved)
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
    
    override func viewDidDisappear(_ animated: Bool) {
        print("탭 사라짐")
    }

    
    
}
