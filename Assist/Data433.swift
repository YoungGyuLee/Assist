//
//  Data433.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit


class Data433 : UIViewController, NetworkCallback{

    var touched : Bool = false
    var changedNum : String = ""
    var willChangNum : String = ""
    var tempNum : String = ""
    var currentSelectedLabel = UILabel()
//    var containerMaster : DataDetailEntry?
//    var containerMaster1 : DataDetailEntry?
    
    let com = Company()
    let ad = UIApplication.shared.delegate as? AppDelegate
  
    var entryList : [TeamEntryVO] = [TeamEntryVO]()


    var atkList : [DataDSAtk] = [DataDSAtk]()
    var defList : [DataDSDef] = [DataDSDef]()
    var midList : [DataDSMid] = [DataDSMid]()
    var gkList : [DataDSGk] = [DataDSGk]()
    var subList : [DataDSSub] = [DataDSSub]()
    
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
    
    var memberList : [Int] = [1,2,3,4,5,6,7,8,9,10,11]
    var memberListString : [String] = ["1","2","3","4","5","6","7","8","9","10","11"]
    var stg : String = "433"
    //int형 배열 선언
    //전술별로 얼마나 끊어야 하는 지 명세
    //번호 바뀔 때 마다 배열의 자리 바꿈
    //이 배열을 바꿀 때마다 부모로 보냄.
    
    //433이면 0//1~4//5~7//8~10 으로 끊어줘야 함.

    func networkResult(resultData: Any, code: String) {
        if code == "참가조회"{
            print("참가조회")
            let tempList = resultData as! DataResultTemp
            atkList = tempList.ATK!
            defList = tempList.DF!
            midList = tempList.MF!
            gkList = tempList.GK!
            subList = tempList.SUB!
            
            makeBakcNumberList()
        }
    

    }
    
    func makeBakcNumberList(){

        print("얄루")
        memberList[0] = gkList[0].backnumber!

        memberList[1] = defList[0].backnumber!
        memberList[2] = defList[1].backnumber!
        memberList[3] = defList[2].backnumber!
        memberList[4] = defList[3].backnumber!
        
        memberList[5] = midList[0].backnumber!
        memberList[6] = midList[1].backnumber!
        memberList[7] = midList[2].backnumber!
        
        memberList[8] = atkList[0].backnumber!
        memberList[9] = atkList[1].backnumber!
        memberList[10] = atkList[2].backnumber!
        
        GKN.text = memberList[0].description
        
        def1N.text = memberList[1].description
        def2N.text = memberList[2].description
        def3N.text = memberList[3].description
        def4N.text = memberList[4].description
        
        
        mid1N.text = memberList[5].description
        mid2N.text = memberList[6].description
        mid3N.text = memberList[7].description
        
        atk1N.text = memberList[8].description
        atk2N.text = memberList[9].description
        atk3N.text = memberList[10].description
        
        
        for i in 0...10{
            print(memberList[i])
            memberListString[i] = memberList[i].description
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ad?.setRecord = true
        //여기서 등번호->이름 딕셔너리 하나 만들어야 함.
    }
    
    
    override func viewDidLoad() {
        //1. 목록을 다 불러온다.
        
        print("저어어어어언술")
        //memberList
        print(ad?.memList)
        if ad?.memList != nil{
            print("닐 아님")
            self.memberList = (ad?.memList)!
            print(self.memberList)
        }
        else{

            let model = DataModel(self)
            model.getDataFromStatus(schedule_id: gino(ad?.scheduleIdForStg), status: "4-3-3")
        }
        //멤버조회

        ad?.curStg = "433"

    }
    
    var list : [Int] = []
    
    func passData(list: [Int]) -> [Int]{
        
        return self.memberList
    }
    
    @IBAction func clickGK(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            let myIndex = memberListString.index(of: GKN.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            changeNum(label1: GKN, label2: currentSelectedLabel)
            //바뀐 라벨을 숫자로 변환해야 함.
            touched = false
            
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            ad?.memList = self.memberList
            

        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
    
            currentSelectedLabel = GKN
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[0]
            
        }
    }
    //333(세부 포지션)
    @IBAction func clickDef1(_ sender: Any) {
        
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.
            
          //  containerMaster?.getList(memList: self.memList, stg: "433")
            
            
            let myIndex = memberListString.index(of: def1N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            
            changeNum(label1:  def1N, label2: currentSelectedLabel)
            touched = false
            
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            
            print(memberList)
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            ad?.memList = self.memberList

            
        }
        else {//내가 처음 선택 됨
    
            currentSelectedLabel = def1N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[1]
        }
    }

    @IBAction func clickDef2(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            
            let myIndex = memberListString.index(of: def2N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            
            changeNum(label1: def2N, label2: currentSelectedLabel)
            
            //currentSelectedLabel.text.int
            touched = false
            
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            
            print(memberList)
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            
            
            ad?.memList = self.memberList

        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = def2N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[2]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[2]
        }
    }
    
    @IBAction func clickDef3(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)

            let myIndex = memberListString.index(of: def3N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            
            changeNum(label1: def3N, label2: currentSelectedLabel)
            touched = false
            
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            
            print(memberList)
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            
            
            ad?.memList = self.memberList
//            print(memberListString)
//            //containerMaster1?.container?.list = self.memberList
//            globalList = self.memberList
            
        }
        else {//내가 처음 선택 됨
            currentSelectedLabel = def3N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
          //  ad?.nowSelect = ad?.memList?[3]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[3]
        }
    }
    
    
    @IBAction func clickDef4(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            let myIndex = memberListString.index(of: def4N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            
            changeNum(label1: def4N, label2: currentSelectedLabel)
            touched = false
            
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            
            print(memberList)
            
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            
            ad?.memList = self.memberList
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = def4N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
           //ad?.nowSelect = ad?.memList?[4]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[4]
        }
    }
    
    @IBAction func clickMid3(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            
            let myIndex = memberListString.index(of: mid3N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)

            
            changeNum(label1: mid3N, label2: currentSelectedLabel)
            touched = false
            
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            
            print(memberList)
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString

            
            ad?.memList = self.memberList
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = mid3N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[7]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[7]
        }
    }
    
    @IBAction func clickMid2(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            
            let myIndex = memberListString.index(of: mid2N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            print(memberList)
            
            changeNum(label1: mid2N, label2: currentSelectedLabel)
            touched = false
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            
            ad?.memList = self.memberList
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = mid2N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[6]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[6]
        }
    }
    
    @IBAction func clickMid1(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            
            let myIndex = memberListString.index(of: mid1N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            
            print(memberList)
            changeNum(label1: mid1N, label2: currentSelectedLabel)
            touched = false
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString

            ad?.memList = self.memberList
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = mid1N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[5]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[5]
        }
    }
    @IBAction func clickAtk1(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            
            let myIndex = memberListString.index(of: atk1N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            print(memberList)
            
            changeNum(label1: atk1N, label2: currentSelectedLabel)
            touched = false
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            

            ad?.memList = self.memberList
            
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = atk1N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[8]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[8]
        }
    }
    @IBAction func clickAtk2(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            let myIndex = memberListString.index(of: atk2N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            print(memberList)
            
            
            changeNum(label1: atk2N, label2: currentSelectedLabel)
            touched = false
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString

            ad?.memList = self.memberList
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = atk2N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[9]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[9]
        }
    }
    @IBAction func clickAtk3(_ sender: Any) {
        if ad?.setRecord == false{
        if touched {//이미 다른 선수 선택함.(나도 포함)
            //GKN.text = changedNum
            let myIndex = memberListString.index(of: atk3N.text!)
            let curIndex = memberListString.index(of: currentSelectedLabel.text!)
            var temp : Int = memberList[myIndex!]
            memberList[myIndex!] = memberList[curIndex!]
            memberList[curIndex!] = temp
            print(memberList)
            
            changeNum(label1: atk3N, label2: currentSelectedLabel)
            touched = false
            
            var tempString : String = memberListString[myIndex!]
            memberListString[myIndex!] = memberListString[curIndex!]
            memberListString[curIndex!] = tempString
            
            ad?.memList = self.memberList
            
        }
        else {//내가 처음 선택 됨
            //changedNum = GKN.text!
            
            currentSelectedLabel = atk3N
            touched = true
        }
        }
        else{
            ad?.previousSelect = ad?.nowSelect
            //ad?.nowSelect = ad?.memList?[10]
            ad?.memList = self.memberList
            ad?.nowSelect = ad?.memList?[10]
        }
    }
}

    
    

