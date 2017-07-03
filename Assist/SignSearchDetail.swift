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
    var teamId : Int?

    @IBOutlet var placeName: UILabel!
    
    @IBOutlet var teamName: UILabel!
    
    @IBOutlet var coachName: UILabel!

    
    @IBOutlet var scrolldetail: UIView!


    override func viewDidLoad() {
        print("들어옴2")
        
        placeName.text = gsno(place)+","
        teamName.text = gsno(team)+","
        coachName.text = gsno(coach)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        print("들어옴4")

        
        //테이블뷰 자체 크기보다 누적되어있는 셀들의 높이들의 합이 더 작을경우( 테이블뷰에 셀이 한두개만있고 나머지 셀은 비어있는 상태)
        //해당 코드로 보기싫은 밑줄들을 지워줍니다
        //쉽게생각해서 비어있는 셀들을 뷰로 덮어버리는거라고 생각하시면됩니다
        //detailTable.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    
    //vieWillAppear
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: {})
    }
}
