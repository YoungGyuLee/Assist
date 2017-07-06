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


class SignDetailVC : UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate{

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
    
    
    var main_data = ["", "수비수", "골키퍼", "공격수", "미드필더"]
    var detail_data : [[String]] = [["수1","수2","수3"],["공1", "공2", "공3"], ["골키퍼"],["미1", "미2", "미3"]]
    
    
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
        
        //userImage.image.layer.cornerRadius
        
       // userImage.image?.accessibilityFrame.cor
        
        toNext.layer.cornerRadius = 4
        
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.mask?.masksToBounds = true
        //imageview.layer.masktobounds
        
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

    @IBAction func toSignSearch(_ sender: Any) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        if let image = userImage.image{
            let imageData = UIImageJPEGRepresentation(image, 0.5)
            //imageData.
            print(image)
            print(imageData)
            ad?.username = name
            ad?.email = email
            ad?.password = password
            ad?.age = Int(ageText.text!)
            ad?.height = Float(heightText.text!)
            ad?.weight = Float(weightText.text!)
            ad?.foot = mainFootText.text
            ad?.position = self.mainPosition.titleLabel?.text
            ad?.position_detail = self.detailPosition.titleLabel?.text
            ad?.backnumber = Int(backNumText.text!)
            //ad?.myTeamId = Int(backNumText.text!)
            ad?.profile_pic = imageData
            //ad?.age =
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

