//
//  MainVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class MainVC : UIViewController{
    @IBAction func toCard(_ sender: Any) {
        let card_storyboard = UIStoryboard(name : "Card", bundle : nil)
        print("들어왔졍1")
        guard let card = card_storyboard.instantiateViewController(withIdentifier: "CardVC") as? CardVC else{return}
        print("들어왔졍2")
        self.present(card, animated: true)
    }
    
    @IBAction func toData(_ sender: Any) {
        let data_storyboard = UIStoryboard(name : "Data", bundle : nil)
        print("들어왔졍1")
        guard let data = data_storyboard.instantiateViewController(withIdentifier: "DataTab") as? DataTab else{return}
        print("들어왔졍2")
        self.present(data, animated: true)
        
    }
    
    @IBAction func toTeam(_ sender: Any) {
        let team_storyboard = UIStoryboard(name : "Team", bundle : nil)
        guard let team = team_storyboard.instantiateViewController(withIdentifier: "TeamTab") as? TeamTab else{return}
        print("들어왔졍2")
        self.present(team, animated: true)
        
    }
    
    @IBAction func toRanking(_ sender: Any) {
        let team_storyboard = UIStoryboard(name : "Rank", bundle : nil)
        guard let rank = team_storyboard.instantiateViewController(withIdentifier: "RankingVC") as? RankingVC else{return}
        self.present(rank, animated: true)
    }
    
    
    
}
