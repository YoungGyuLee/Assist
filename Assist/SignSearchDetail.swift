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
    
    var progress1: KDCircularProgress!
    
    
    



    override func viewDidLoad() {
        print("상세 검색 들어옴")
        
        placeName.text = place
        teamName.text = team
        coachName.text = coach
    
        
    
    
        //view.backgroundColor = UIColor(white: 0.22, alpha: 1)
        
        progress1 = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progress1.startAngle = -90
        progress1.progressThickness = 0.2
        progress1.trackThickness = 0.6
        progress1.clockwise = true
        progress1.gradientRotateSpeed = 4
        progress1.roundedCorners = false
        progress1.glowMode = .forward
        progress1.glowAmount = 0.9
        //progress1.backgroundColor = UIColor.red
       // progress1.progressInsideFillColor = UIColor.red
        //progress1.progressColors = [UIColor.red]
        progress1.trackColor = UIColor.red
        
        //progress1.
        // progress1.trackColor
        // progress1
        //progress1.UIColor = fromhe
        progress1.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        
        view.addSubview(progress1)
    }
    
    

    @IBAction func changeValue(_ sender: UIButton) {
        progress1.animate(fromAngle: 0, toAngle: 200, duration: 5) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("상세 검색 사라짐")
    }
    @IBAction func signUp(_ sender: Any) {
        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
        print("들어왔졍1")
        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
        print("들어왔졍2")
        self.present(main, animated: true)
        
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: {})
    }
}
