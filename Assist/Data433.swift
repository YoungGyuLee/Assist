//
//  Data433.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class Data433 : UIViewController{
    
    
    var touched : Bool = false
    var changedNum : String = ""
    var willChangNum : String = ""
    var tempNum : String = ""
    var currentSelectedLabel = UILabel()
    
    @IBOutlet var GKN: UILabel!
    
    @IBOutlet var def1N: UILabel!
    @IBOutlet var def2N: UILabel!
    @IBOutlet var def3N: UILabel!
    @IBOutlet var def4N: UILabel!
    
    @IBOutlet var mid1N: UILabel!
    @IBOutlet var mid2N: UILabel!
    @IBOutlet var mid3N: UILabel!
    
    @IBOutlet var atk1N: UILabel!
    @IBOutlet var atk2N: UILabel!
    @IBOutlet var atk3N: UILabel!
    
    
    
    override func viewDidLoad() {

        
        GKN.text = 1.description
        
        def1N.text = 2.description
        def2N.text = 3.description
        def3N.text = 4.description
        def4N.text = 5.description
        
        
        mid1N.text = 6.description
        mid2N.text = 7.description
        mid3N.text = 8.description
        
        atk1N.text = 9.description
        atk2N.text = 10.description
        atk3N.text = 11.description
    
        
        
        
       // atk3.
    }
    
    @IBAction func clickGK(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: GKN, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
    
            currentSelectedLabel = GKN
            touched = true
        }
    }
    //333(세부 포지션)
    @IBAction func clickDef1(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.
            changeNum(label1:  def1N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
    
            currentSelectedLabel = def1N
            touched = true
        }
    }

    @IBAction func clickDef2(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: def2N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = def2N
            touched = true
        }
    }
    
    @IBAction func clickDef3(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: def3N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = def3N
            touched = true
        }
    }
    
    
    @IBAction func clickDef4(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: def4N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = def4N
            touched = true
        }
    }
    
    @IBAction func clickMid3(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: mid3N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = mid3N
            touched = true
        }
    }
    
    @IBAction func clickMid2(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: mid2N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = mid2N
            touched = true
        }
    }
    
    @IBAction func clickMid1(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: mid1N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = mid1N
            touched = true
        }
    }
    @IBAction func clickAtk1(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: atk1N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = atk1N
            touched = true
        }
    }
    @IBAction func clickAtk2(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: atk2N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = atk2N
            touched = true
        }
    }
    @IBAction func clickAtk3(_ sender: Any) {
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            changeNum(label1: atk3N, label2: currentSelectedLabel)
            touched = false
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = atk3N
            touched = true
        }
    }
    
    
    
    func changeNum(label1 : UILabel, label2 : UILabel){
        print("변경 들어옴")
//        var tempStr : String = ""
//        tempStr = (btn1.titleLabel?.text)!
//        btn1.titleLabel?.text = btn2.titleLabel?.text
//        btn2.titleLabel?.text = tempStr
        
        var tempStr1 : String = ""
        tempStr1 = label1.text!
        label1.text = label2.text
        label2.text = tempStr1
        
        
    }
}

    
    

