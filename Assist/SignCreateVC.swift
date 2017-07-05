//
//  SignCreateVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit
import DropDown

class SignCreateVC : UIViewController, UITextFieldDelegate, NetworkCallback, UIGestureRecognizerDelegate{
    @IBOutlet var back: UINavigationItem!
    
    @IBOutlet var placeText: UIButton!
    @IBOutlet var teamText: UITextField!
    @IBOutlet var coachText: UITextField!
    @IBOutlet var foundText: UITextField!
    @IBOutlet var signBtn: UIButton!
    
    @IBOutlet var placeName: UILabel!
    @IBOutlet var meaage: UITextField!
    let dateForamtterGet = DateFormatter()
    var date = Date()
    
    var today : String? = nil
    
    var createResult : Int = 0
    let picker = UIImagePickerController()
    var signResponse : SignVO?
    @IBOutlet var teamImg: UIImageView!
    var place_data = ["서울시", "성남시", "제네바", "오타와", "레이캬비크"]
    let dropDownPlace = DropDown()
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        
        self.navigationController?.isNavigationBarHidden = true
        //teamImg.layer.Ra
        teamImg.layer.cornerRadius = teamImg.frame.width/2
        dropDownPlace.anchorView = placeText.self
        dropDownPlace.dataSource = place_data
        dropDownPlace.direction = .bottom
        signBtn.layer.cornerRadius = 4
        
        teamText.delegate = self
        coachText.delegate = self
        foundText.delegate = self
        foundText.delegate = self
        
        //수정 가능 옵션
        picker.allowsEditing = false
        //델리게이트 지정
        picker.delegate = self
        
        dateForamtterGet.dateFormat = "yyyy-MM-dd"
        today = dateForamtterGet.string(from: self.date)
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
        self.placeText.resignFirstResponder()
        //텍뷰에 포커스 아웃.
        self.teamText.resignFirstResponder()
        self.coachText.resignFirstResponder()
        self.foundText.resignFirstResponder()
        self.meaage.resignFirstResponder()
        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "팀창단"{
            createResult = resultData as! Int
            print("팀 번호 \(createResult)")
            
            let model = SignSplashModel(self)
            
            if let profile = ad?.profile_pic{
                print(profile)
                model.signUp(username:gsno(ad?.username), email:gsno(ad?.email), password:gsno(ad?.password),age:gino(ad?.age), height : gfno(ad?.height), weight : gfno(ad?.weight), foot : gsno(ad?.foot) ,position : gsno("MF"),position_detail : gsno("RM"),backnumber : gino(ad?.backnumber), team_id : gino(createResult), profile_pic:profile as! Data)
            }
            
            

            
        }
        if code == "회원가입"{
            
            signResponse = resultData as! SignVO
            ad?.userId = signResponse?.id
            ad?.myTeamId = signResponse?.team_id
            
            
            print("회원 아이디 \(ad?.userId)")
            print("팀 아이디 \(ad?.myTeamId)")
            
            let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
            print("창단 회원가입")
            guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
            self.present(main, animated: true)

        }
   
    }
    
    
    
    @IBAction func setPlace(_ sender: Any) {
        dropDownPlace.show()
        dropDownPlace.selectionAction = { [unowned self] (index: Int, item: String) in
            //self.mainText = item
            self.placeText.titleLabel?.text = item
            self.placeName.text = item
        }
    }

    
    @IBAction func toMain(_ sender: Any) {
        let model = SignSplashModel(self)
        if let image = teamImg.image{
            let imageData = UIImageJPEGRepresentation(image, 0.5)
        
        model.teamCreate(teamname: gsno(teamText.text), region: gsno(placeName.text), manager: gsno(coachText.text), found_dt: gsno(foundText.text), message: gsno(meaage.text), profile_pic: imageData)
            }
//        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
//        print("들어왔졍1")
//                        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
//                        print("들어왔졍2")
//                        self.present(main, animated: true)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SelectProfile(_ sender: Any) {
        present(picker, animated: true, completion: nil)
    }
    
    

}


extension SignCreateVC : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
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
        
        teamImg.image = newImage
        teamImg.layer.cornerRadius = teamImg.frame.size.height/2
        teamImg.layer.mask?.masksToBounds = true
        
        //newImage.
        dismiss(animated: true, completion: nil)
    }
}
