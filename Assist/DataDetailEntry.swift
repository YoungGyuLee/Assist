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
    
    @IBOutlet var stgNone: UIView!
    @IBOutlet var stg433: UIView!
    @IBOutlet var stg442: UIView!
    @IBOutlet var stg343: UIView!
    @IBOutlet var stg352: UIView!
    @IBOutlet var stg451: UIView!
    var stgType : String?
    

    override func viewDidLoad() {
        stgNone.isHidden = false
        stg433.isHidden = true
        stg442.isHidden = true
        stg343.isHidden = true
        stg352.isHidden = true
        stg451.isHidden = true
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
//        let okAction = UIAlertAction(title:"확인",  style:.default) { (_) in self.performSegue(withIdentifier: "VC1", sender: self)}
//        
        
        //위 클로저는 아래와 같은 것이다.
        let okkAction = UIAlertAction(title: "확인", style: .default, handler: {(_) in self.performSegue(withIdentifier: "DataDetailEntry2", sender: self)})
        
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: {(_) in self.nextStep()
//            
//        })
        //클로저 기본 식 : {(매개변수)->반환형 in 구문}
        //함수의 이름이 없다고 생각하면 될 듯 싶다.
        //(_)가 있다는 것은 매개변수가 없다고 생각하면 될 듯.
        
        
        alert.addAction(okkAction)
        alert.addAction(noAction)
        
        present(alert, animated:true)
    }
    
    func nextStep(){
        guard let entry = storyboard?.instantiateViewController(withIdentifier: "DataDetailEntry2") as? DataDetailEntry2 else {return}
        navigationController?.present(entry, animated:false, completion:{})
    }
}
