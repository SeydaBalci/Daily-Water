//
//  Data.swift
//  Daily Water
//
//  Created by Şeyda Şeyma Balcı on 5/10/20.
//  Copyright © 2020 Şeyda Şeyma Balcı. All rights reserved.
//

import Foundation

class DataStore {
    
    //Assets
    
    let defaults = UserDefaults.standard
    
    var currentDay: Int{
        let now = Date()
        let day = Calendar.current.component(.day, from: now)
        return day
    }
    
    // Functions
    
    func getCurrentAmount() -> Double {
        let savedAmount = defaults.double(forKey: "currentAmount")
        return savedAmount
    }
    
    func getLatestUpdate() -> Int {
        let latestDay = defaults.integer(forKey: "latestUpdate")
        return latestDay
    }
    
    func addWater(amount: Double) {
        let currentAmount = getCurrentAmount()
        let newAmount = currentAmount + amount
        
        defaults.set(newAmount, forKey: "currentAmount")
        defaults.set(currentDay, forKey: "latestUpdate")
        
    }
    
    // Period
    init() {
        let latestUpdate = getLatestUpdate()
        if latestUpdate != currentDay{
            defaults.set(0, forKey: "currentAmount")
        }
    }
}
