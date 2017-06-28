//
//  SignDetailVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit
import DropDown


class SignDetailVC : UIViewController, UIGestureRecognizerDelegate{

    var navBar: UINavigationBar = UINavigationBar()
    
    @IBOutlet var back: UINavigationItem!
    @IBOutlet var mainPosition: UIButton!
    @IBOutlet var detailPosition: UIButton!
   
    
    var main_Picker = UIPickerView()
    var detail_Picker = UIPickerView()
    
    var main_Toolbar = UIToolbar()
    var detail_Toolbar = UIToolbar()
    
    var main_category_index : Int?
    
    let dropDownMain = DropDown()
    let dropDownDetailAttack = DropDown()
    let dropDownDetailDefense = DropDown()
    let dropDownDetailMid = DropDown()
    let dropDownDetailGaolK = DropDown()
    
    var mainText : String?
    var detailText : String?
    
    
    
    var main_data = ["", "수비수", "골키퍼", "공격수", "미드필더"]
    var detail_data : [[String]] = [["수1","수2","수3"],["공1", "공2", "공3"], ["골키퍼"],["미1", "미2", "미3"]]
    
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userImageSelect: UIButton!
    

    
    override func viewWillAppear(_ animated: Bool) {
        back.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "join_left_button"), style: .plain, target: self, action: #selector(goback))
        
       // back.title = "회원가입"
        // back.title.co
        self.navBar.frame = CGRect(x: 0, y: 0, width: 375, height: 67)
        self.navBar.barTintColor = uicolorFromHex(rgbValue: 0x012A6A)
        self.navBar.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        self.navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        self.navigationItem.title = "회원가입"
        
        
        self.navBar.setItems([back], animated: false)
        self.view.addSubview(navBar)
        
        
        
        
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.mask?.masksToBounds = true
        
        userImageSelect.layer.cornerRadius = userImageSelect.frame.size.height/2
        userImageSelect.layer.mask?.masksToBounds = true
        
    }
    @IBAction func setMain(_ sender: Any) {
        dropDownMain.show()
        dropDownMain.selectionAction = { [unowned self] (index: Int, item: String) in
            self.mainText = item
            self.mainPosition.titleLabel?.text = item
        }
        
        
    }
    
    @IBAction func setDetail(_ sender: Any) {
       // if mainText?.contains("공")
        if (mainText?.contains("공격수"))!{
            dropDownDetailAttack.show()
            dropDownDetailAttack.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
            }
        }
        
        else if (mainText?.contains("수비수"))!{
            dropDownDetailDefense.show()
            dropDownDetailDefense.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
            }
        }
        
        else if (mainText?.contains("미드필더"))!{
            dropDownDetailMid.show()
            dropDownDetailMid.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
            }
        }
        
        else if (mainText?.contains("골키퍼"))!{
            dropDownDetailGaolK.show()
            dropDownDetailGaolK.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
            }
        }
        
        
        
        
    }

    
    override func viewDidLoad() {

        self.view.isUserInteractionEnabled = true
        
        dropDownMain.anchorView = mainPosition.self
        dropDownMain.dataSource = ["", "공격수", "수비수", "미드필더", "골키퍼"]
        dropDownMain.direction = .bottom

        
        dropDownDetailAttack.anchorView = detailPosition.self
        dropDownDetailAttack.dataSource = ["공1","공2","공3"]
        dropDownDetailAttack.direction = .bottom
        
        dropDownDetailDefense.anchorView = detailPosition.self
        dropDownDetailDefense.dataSource = ["수1", "수2", "수3"]
        dropDownDetailDefense.direction = .bottom
        
        dropDownDetailMid.anchorView = detailPosition.self
        dropDownDetailMid.dataSource = ["미1", "미2", "미3"]
        dropDownDetailMid.direction = .bottom
        
        dropDownDetailGaolK.anchorView = detailPosition.self
        dropDownDetailGaolK.dataSource = ["골키퍼"]
        dropDownDetailGaolK.direction = .bottom
        
        
        
    }

    @IBAction func imageSelect(_ sender: Any) {
        //이미지 선택 코드
        
        
    }
    @IBAction func toSignSearch(_ sender: Any) {
        
        guard let signTab = storyboard?.instantiateViewController(withIdentifier: "SignTabVC") as? SignTab else {return}
        navigationController?.present(signTab, animated: true, completion: {})
        //navigationController?.pushViewController(signTab, animated: true)

    }
    
    func goback(){

        navigationController?.popViewController(animated: true)
    }
}
