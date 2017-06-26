//
//  SignBaseVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignBaseVC : UIViewController{
    
    @IBOutlet var back: UINavigationItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inin!!")
        back.leftBarButtonItem = UIBarButtonItem(title: "<<", style: .plain, target: self, action: #selector(goback))
        // Do any additional setup after loading the view, typically from a nib.
    }
    func goback(){
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool)  {
        print("들어오오오오옴")
        
        //let aObjNavi = UINavigationController(rootViewController: self)
        //let aObjNavi = UINavigationController(rootViewController: objVC!)
//        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
//        appDelegate.window?.rootViewController = self
    
    }
    
    
    @IBAction func toSignDetail(_ sender: Any) {
        guard let signDetail = storyboard?.instantiateViewController(withIdentifier: "SignDetailVC") as? SignDetailVC else {return}
        
        navigationController?.pushViewController(signDetail, animated: true)
        
    }

    
    
    
}
