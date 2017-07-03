//
//  ExtensionControl.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import Kingfisher



extension UIViewController{
    
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
    func gfno(_ data: Float?) -> Float {
        guard let floatinNum = data else {
            return 0
        }
        return floatinNum
    }
    

    
    func changeNum(label1 : UILabel, label2 : UILabel){
        print("변경 들어옴")
        var tempStr1 : String = ""
        tempStr1 = label1.text!
        label1.text = label2.text
        label2.text = tempStr1

    }
  
    func returnList(list : [Int])-> [Int]{
        let nowlist = list
        return nowlist
    }
    
    var globalList : [Int]{ get{
            return [0]
        }set(newVal){
            //globalList = newVal
        }}
    
    class Company {
        var _members:[Int] = []
        var members:[Int] {
            get {
                return _members
            }
            set (newVal) {
                _members = newVal
            }
        }
    }
    
    func networkFailed() {
        let alert = UIAlertController(title: "네트워크 오류", message: "인터넷 연결을 확인해주세요.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
}

