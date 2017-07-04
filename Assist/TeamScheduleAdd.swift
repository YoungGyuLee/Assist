//
//  TeamScheduleAdd.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

protocol getCurrentDate{
    func getDate(date : Date)
    //일종의 인터페이스
}

class TeamScheduleAdd : UIViewController{
    
    @IBOutlet var addSchedule: UIButton!
   
    var date = Date()
    var containerToMaster:getCurrentDate?
    //인터페이스 변수
    let ad = UIApplication.shared.delegate as? AppDelegate
    let dateForamtterGet = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSchedule.layer.cornerRadius = 4
        print("뷰 생성")
        
    }


    @IBAction func addSchedule(_ sender: Any) {
        //print(containerToMaster?.getDate(date: self.date))
        print(self.date)
        guard let dataInsert = storyboard?.instantiateViewController(withIdentifier: "TeamScheduleInsert") as? TeamScheduleInsert else {return}
        
        dateForamtterGet.dateFormat = "yyyy-MM-dd"
       // dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        dataInsert.gameDateString = self.dateForamtterGet.string(from: (ad?.date)!)

        navigationController?.pushViewController(dataInsert, animated: true)

    }
    
    func getDate(date : Date){
        self.date = date
    }//인터페이스가 갖고 있는 함수.

}
