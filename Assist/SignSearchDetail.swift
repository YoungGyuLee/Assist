//
//  SignSearchDetail.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit
import KDCircularProgress

class SignSearchDetail : UIViewController{
    
    var team : String?
    var coach : String?
    var place : String?

    @IBOutlet var placeName: UILabel!
    
    @IBOutlet var teamName: UILabel!
    
    @IBOutlet var coachName: UILabel!

    
    @IBOutlet var scrolldetail: UIView!
    



    override func viewDidLoad() {
        print("상세 검색 들어옴")
        
        placeName.text = place!+","
        teamName.text = team!+","
        coachName.text = coach
        
        scrolldetail.isHidden = false

        
        //detailScroll.
    
    
        //view.backgroundColor = UIColor(white: 0.22, alpha: 1)
        

    }
    
    
//
//    @IBAction func changeValue(_ sender: UIButton) {
//        progress1.animate(fromAngle: 0, toAngle: 200, duration: 5) { completed in
//            if completed {
//                print("animation stopped, completed")
//            } else {
//                print("animation stopped, was interrupted")
//            }
//        }
//    }
    override func viewDidDisappear(_ animated: Bool) {
        print("상세 검색 사라짐")
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: {})
    }
}
