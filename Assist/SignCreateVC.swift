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

class SignCreateVC : UIViewController, UITextFieldDelegate{
    @IBOutlet var back: UINavigationItem!
    
    @IBOutlet var placeText: UIButton!
    @IBOutlet var teamText: UITextField!
    @IBOutlet var coachText: UITextField!
    @IBOutlet var foundText: UITextField!
    @IBOutlet var signBtn: UIButton!
    
    @IBOutlet var teamImg: UIImageView!
    var place_data = ["서울시", "성남시", "제네바", "오타와", "레이캬비크"]
    let dropDownPlace = DropDown()
    
    
    override func viewDidLoad() {
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
    
    
    
    @IBAction func setPlace(_ sender: Any) {
        dropDownPlace.show()
        dropDownPlace.selectionAction = { [unowned self] (index: Int, item: String) in
            //self.mainText = item
            self.placeText.titleLabel?.text = item
        }
    }

    
    @IBAction func toMain(_ sender: Any) {
        
                        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
                        print("들어왔졍1")
                        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
                        print("들어왔졍2")
                        self.present(main, animated: true)
        
    }

    
}
