//
//  DataDetailEntry.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit


class DataDetailEntry : UIViewController{
    //433 442 343 352 451
    
    
//    var listContainer : getMemberList?
//    var container : FristDelegate?
 
    //이전 뷰에서 받아오는 데이터들
    
            var id : Int?
            var game_dt : String?
            var place : String?
            var against_team : String?
            var message : String?
            var score_team : Int?
            var score_against_team : Int?
            var tactic : String?
    
    
    

    var memList : [Int]?
    var stg : String?
    //var containerToMaster:getMemberList?
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet var stgNone: UIView!
    @IBOutlet var stg433: UIView!
    @IBOutlet var stg442: UIView!
    @IBOutlet var stg343: UIView!
    @IBOutlet var stg352: UIView!
    @IBOutlet var stg451: UIView!
    var stgType : String?
    //var delegate
    

    override func viewDidLoad() {
        stgNone.isHidden = false
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
        
        print(id)
        print(game_dt)
        print(place)
        print(against_team)
        print(message)
        print(score_team)
        print(score_against_team)
        print(tactic)
        
        
        
        //dataFirst.delegate = dataSecond
        //sent.delegate
       // listContainer.d
        
        //일단 여기서 모든 데이터 받아옴.

    }
    
    @IBAction func set433(_ sender: Any) {
        //버튼 누르면 엔트리 등번호 배치. 배치할 때 값은 여기서 갖고 있어야 함.
        //
        stgNone.isHidden = true
        stg433.isHidden = false
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set442(_ sender: Any) {
        stgNone.isHidden = true
        stg433.isHidden = true
        stg442.isHidden = false
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set343(_ sender: Any) {
        stgNone.isHidden = true
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = false
        stg352.isHidden = true
        stg451.isHidden = true
    }
    
    @IBAction func set352(_ sender: Any) {
        stgNone.isHidden = true
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = false
        stg451.isHidden = true
    }
    
    @IBAction func set451(_ sender: Any) {
        stgNone.isHidden = true
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = false
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: {})
    }
    
    @IBAction func next(_ sender: Any) {
        //이거 누르고 다음 단계로 넘어가는데 이때 엔트리 번호 넘길 것.
        simpleAlert(title: "다음 단계", message: "갈 때는 마음대로지만 올 때는 아니란다.")
        
    }
    
    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        //let okAction = UIAlertAction(title:"확인", style:.default)
        let noAction = UIAlertAction(title:"아니오", style:.cancel)
        
        //var action : UIAlertAction
        let okAction = UIAlertAction(title:"확인",  style:.default) { (_) in self.performSegue(withIdentifier: "DataDetailEntry2", sender: self)}
        //옆동네에 줘야 하는 것 : 포지션 타입, 포지션 별 등번호
        
        
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        present(alert, animated:true)
    }
    
    func nextStep(){
        print("다음 실행")

    }
    @IBAction func checkBtn(_ sender: Any) {
        self.memList = ad?.memList
        self.stgType = ad?.curStg
        
        if let list1 = self.memList{
            print(list1)
        }
        print(self.memList!)
        print(self.stgType!)

    }

//    func getList(memList : [Int]?, stg : String?){
//        print("겟 리스트 실행")
//        self.memList = memList
//        self.stg = stg
//        
//
//    }
}
