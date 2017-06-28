//
//  SignTemp2.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit


class SignTemp2 : UIViewController{
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        //        print("comeTOHere")
        //        guard let signDetail = storyboard?.instantiateViewController(withIdentifier: "SignDetailVC") as? SignDetailVC else {return}
        //        //navigationController?.present(signSearch, animated: true, completion: {})
        //        self.present(signDetail, animated: true, completion: {})
        //navigationController?.popViewController(animated: true)
        
        print("들어왔쪄염 팝")
        navigationController?.dismiss(animated: false, completion: {})
    }
}
