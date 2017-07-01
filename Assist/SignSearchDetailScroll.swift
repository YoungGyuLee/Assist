//
//  SignSearchDetailScroll.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit
import KDCircularProgress

class SignSearchDetailScroll : UIViewController{
    
    @IBOutlet var teamImg: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var place: UILabel!
    @IBOutlet var coach: UILabel!
    @IBOutlet var foundDate: UILabel!
    @IBOutlet var teamMsg: UITextView!
    
    var progress1: KDCircularProgress!
    @IBOutlet var progressbase: UIView!
    
    @IBOutlet var sign: UIButton!
    
    @IBAction func sign(_ sender: Any) {
        let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
        print("들어왔졍1")
        guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
        print("들어왔졍2")
        self.present(main, animated: true)
    }
    
    override func viewDidLoad() {
        progress1 = KDCircularProgress(frame: progressbase.frame)
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
        
        progressbase.addSubview(progress1)
        
        //place.text = self.viewCon
        
    }
    
    
}
