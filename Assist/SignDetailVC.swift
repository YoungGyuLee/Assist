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


class SignDetailVC : UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate, NetworkCallback{

    var navBar: UINavigationBar = UINavigationBar()
    
    var name : String?
    var email : String?
    var password: String?
    
    
    @IBOutlet var ageText: UITextField!
    
    @IBOutlet var heightText: UITextField!
    
    @IBOutlet var weightText: UITextField!
    
    @IBOutlet var mainFootText: UITextField!
    
    @IBOutlet var backNumText: UITextField!
    
    
    @IBOutlet var back: UINavigationItem!
    @IBOutlet var mainPosition: UIButton!
    @IBOutlet var detailPosition: UIButton!
    
    @IBOutlet var toNext: UIButton!
    let picker = UIImagePickerController()

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
    
    @IBOutlet var selectedPosition: UILabel!
  
    @IBOutlet var selectedDetailPos: UILabel!
    
    var mainPositionKey : [String:String] = [:]
    var mainDetailKey : [String:String] = [:]
    var main_data = ["", "수비수", "골키퍼", "공격수", "미드필더"]
    var detail_data : [[String]] = [["수1","수2","수3"],["스트라이커(ST)", "공2", "공3"], ["골키퍼"],["미1", "미2", "미3"]]
    
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userImageSelect: UIButton!
    

    @IBAction func setProfile(_ sender: Any) {
        present(picker, animated: true, completion: nil)
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
        print("이미지 들어옴요1")
        back.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "left"), style: .plain, target: self, action: #selector(goback))
        
       // back.title = "회원가입"
        // back.title.co
        self.navBar.frame = CGRect(x: 0, y: 0, width: 375, height: 67)
        self.navBar.barTintColor = uicolorFromHex(rgbValue: 0x012A6A)
        self.navBar.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        self.navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        self.navigationItem.title = "회원가입"
        
        
        self.navBar.setItems([back], animated: false)
        self.view.addSubview(navBar)
        

        
        toNext.layer.cornerRadius = 4
        
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
            self.selectedPosition.text = item
        }
    }
    
    @IBAction func setDetail(_ sender: Any) {
       // if mainText?.contains("공")
        if (mainText?.contains("공격수"))!{
            dropDownDetailAttack.show()
            dropDownDetailAttack.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
                self.selectedDetailPos.text = item
            }
        }
        
        else if (mainText?.contains("수비수"))!{
            dropDownDetailDefense.show()
            dropDownDetailDefense.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
                self.selectedDetailPos.text = item
            }
        }
        
        else if (mainText?.contains("미드필더"))!{
            dropDownDetailMid.show()
            dropDownDetailMid.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
                self.selectedDetailPos.text = item
            }
        }
        
        else if (mainText?.contains("골키퍼"))!{
            dropDownDetailGaolK.show()
            dropDownDetailGaolK.selectionAction = { [unowned self] (index: Int, item: String) in
                self.detailText = item
                self.detailPosition.titleLabel?.text = item
                self.selectedDetailPos.text = item
            }
        }
        
    }

    
    override func viewDidLoad() {
        
        print("얍")
        
        // = ["공격수":"ATK", "미드필더":"MF", "수비수:DF", "골키퍼:GK"]
        mainPositionKey["공격수"] = "ATK"
        mainPositionKey["미드필더"] = "MF"
        mainPositionKey["골키퍼"] = "GK"
        mainPositionKey["수비수"] = "DF"
        print("얍")
        mainDetailKey["중앙수비수(CB)"] = "CB"
        mainDetailKey["측면수비수(FB)"] = "FB"
        mainDetailKey["윙백(WB)"] = "WB"
        mainDetailKey["골키퍼(GK)"] = "GK"
        mainDetailKey["스트라이커(ST)"] = "ST"
        mainDetailKey["윙포워드(WF)"] = "WF"
        mainDetailKey["센터포워드(CF)"] = "CF"
        mainDetailKey["공격형미드필더(AM)"] = "AM"
        mainDetailKey["수비형미드필더(DM)"] = "DM"
        mainDetailKey["윙어(WM)"] = "WM"
        
        print("얍")        
        print("이미지 들어옴요2")
        self.view.isUserInteractionEnabled = true
        ageText.delegate = self
        ageText.tag = 0
        
        heightText.delegate = self
        heightText.tag = 1
        
        weightText.delegate = self
        weightText.tag = 2
        
        mainFootText.delegate = self
        mainFootText.tag = 3
        
        backNumText.delegate = self
        backNumText.tag = 4
        
        ageText.tintColor = uicolorFromHex(rgbValue : 0xffffff)
        heightText.tintColor = uicolorFromHex(rgbValue :0xffffff)
        mainFootText.tintColor = uicolorFromHex(rgbValue :0xffffff)
        backNumText.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
    
        
        //수정 가능 옵션
        picker.allowsEditing = false
        //델리게이트 지정
        picker.delegate = self
        
        
        
        dropDownMain.anchorView = mainPosition.self
        dropDownMain.dataSource = ["", "공격수", "수비수", "미드필더", "골키퍼"]
        dropDownMain.direction = .bottom
        
        dropDownDetailAttack.anchorView = detailPosition.self
        dropDownDetailAttack.dataSource = ["스트라이커(ST)","윙포워드(WF)","센터포워드(CF)"]
        dropDownDetailAttack.direction = .bottom
        
        dropDownDetailDefense.anchorView = detailPosition.self
        dropDownDetailDefense.dataSource = ["중앙수비수(CB)", "측면수비수(FB)", "윙백(WB)"]
        dropDownDetailDefense.direction = .bottom
        
   
        dropDownDetailMid.anchorView = detailPosition.self
        dropDownDetailMid.dataSource = ["공격형미드필더(AM)", "수비형미드필더(DM)", "윙어(WM)"]
        dropDownDetailMid.direction = .bottom
        
        dropDownDetailGaolK.anchorView = detailPosition.self
        dropDownDetailGaolK.dataSource = ["골키퍼(GK)"]
        dropDownDetailGaolK.direction = .bottom
        
        dropDownMain.backgroundColor = uicolorFromHex(rgbValue: 0x165388)
        dropDownMain.backgroundColor?.withAlphaComponent(0.9)
        dropDownMain.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        dropDownDetailAttack.backgroundColor = uicolorFromHex(rgbValue: 0x165388)
        dropDownDetailAttack.backgroundColor?.withAlphaComponent(0.9)
        dropDownDetailAttack.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        dropDownDetailMid.backgroundColor = uicolorFromHex(rgbValue: 0x165388)
        dropDownDetailMid.backgroundColor?.withAlphaComponent(0.9)
        dropDownDetailMid.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        
        dropDownDetailDefense.backgroundColor = uicolorFromHex(rgbValue: 0x165388)
        dropDownDetailDefense.backgroundColor?.withAlphaComponent(0.9)
        dropDownDetailDefense.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        
        dropDownDetailGaolK.backgroundColor = uicolorFromHex(rgbValue: 0x165388)
        dropDownDetailGaolK.backgroundColor?.withAlphaComponent(0.9)
        dropDownDetailGaolK.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        
        
        
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.mask?.masksToBounds = true
        
        
        
    }
    func networkResult(resultData: Any, code: String) {
        
    }
    
    

    @IBAction func toSignSearch(_ sender: Any) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        if let image = userImage.image{
            let imageData = UIImageJPEGRepresentation(image, 0.5)

            ad?.profile_pic = imageData
            //ad?.age =
            
            let model = SignSplashModel(self)

            model.signUp(username:gsno(ad?.username), email:gsno(ad?.email), password:gsno(ad?.password),age: gino(Int(ageText.text!)), height : gfno(Float(heightText.text!)), weight : gfno(Float(weightText.text!)), foot : gsno(mainFootText.text) ,position :  mainPositionKey[gsno(selectedPosition.text)]!,position_detail : mainDetailKey[gsno(selectedDetailPos.text)]!,backnumber : gino(ad?.backnumber), team_id : gino(ad?.myTeamId), profile_pic:userImage as! Data)
        
        
        
        
        }
        
 
        
        guard let signTab = storyboard?.instantiateViewController(withIdentifier: "SignTabVC") as? SignTab else {return}
        navigationController?.present(signTab, animated: true, completion: {})
        //navigationController?.pushViewController(signTab, animated: true)

    }
    
    func goback(){

        navigationController?.popViewController(animated: true)
    }
}
extension SignDetailVC : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //사진 선택 안하고 종료 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //사진 선택 관련 컨트롤러
    //이미지 피커 컨트롤러에서 이미지를 선택하거나 카메라 촬영을 완료 했을 때, 호출되는 메소드입니다 만약 선택한 이미지에 대한 수정 옵션이 설정되어 있다면 이미지 수정 작업이 완료되었을 때 호출됩니다.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            // UIImagePickerControllerEditedImage 이미지가 수정된 경우 수정된 이미지를 전달합니다
            //이미지를 이미지뷰(newImage) 에 표시
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            //UIImagePickerControllerOriginalImage 는 이미지 피커 컨트롤러에서 선택한 이미지에 대한 원본 이미지 데이터입니다. 이미지가 수정되었더라도 이 키를 이용하면 원본 데이터를 받을 수 있습니다.
            
            //이미지를 미지뷰(newImage)에 표시
            newImage = possibleImage
        } else {
            return
        }
        
        userImage.image = newImage
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.mask?.masksToBounds = true
        
        //newImage.
        dismiss(animated: true, completion: nil)
    }
}

