//
//  ViewController.swift
//  Daily Water
//
//  Created by Şeyda Şeyma Balcı on 5/10/20.
//  Copyright © 2020 Şeyda Şeyma Balcı. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Labels
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var waterLevel: NSLayoutConstraint!
    
    // UI Buttons
   

    @IBAction func addWaterBtnTapped(_ sender: UIButton) {
        
        var waterAmount = 0.0
        switch sender.tag {
        case 0:
            waterAmount = 200
        case 1:
            waterAmount = 500
        case 2:
            waterAmount = 700
        default:
            break
        }
        waterStore.addWater(amount: waterAmount)
        updateAppereance()
    }
    
    // Assets
    
    let waterStore = DataStore()
    
    let targetAmount = 2500.0
    
    
    // Functions
    
    func updateWaterLevel(amount: Double) {
        let screenHeight = Double(view.frame.size.height)
        let ratio = amount / targetAmount
        let calculatedHeight = screenHeight * ratio
        
        waterLevel.constant = CGFloat(calculatedHeight)
        
        UIViewPropertyAnimator.init(duration: 0.5, dampingRatio: 0.75) {
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
    
    func updateLabel(amount: Double) {
        let amountToTarget = (targetAmount - amount) / 1000
        if amount < targetAmount{
            let subtitleText = String(format: "You need \n%g more liter for your body.", amountToTarget)
            subtitleLbl.text = subtitleText
            
            if amount == 0  {
                titleLbl.text = "Hi! \nDid you drink water today? "
            }else{
                titleLbl.text = "Great! \nKeep Going☀️"
            }
        }else{
            titleLbl.text = "Excelent! \nYou are Freshed."
            subtitleLbl.text = "You are full of liquids!"
        }
    }
    func updateAppereance() {
        let currentWaterAmount = waterStore.getCurrentAmount()
        
        updateLabel(amount: currentWaterAmount)
        updateWaterLevel(amount: currentWaterAmount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAppereance()
    }


}

