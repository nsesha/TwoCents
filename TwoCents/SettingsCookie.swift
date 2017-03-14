//
//  SettingsCookie.swift
//  TwoCents
//
//  Created by admin on 3/6/17.
//  Copyright © 2017 Seshadri N. All rights reserved.
//

import UIKit

class SettingsCookie {
    struct Settings {
        static let defaultCurrency = "default_currency_index"
        static let defaultTip = "default_tip_index"
        static let defaults = UserDefaults.standard
        static let savedTip = "saved_tip_index"
        static let savedBill = "saved_bill_index"
        static let lastBillTimestamp = "last_bill_timestamp"
        
        static let billAmountTTL = TimeInterval(10 * 60)
    }
    
    class func setDefaultCurrency(currencyIndex: Int) {
        Settings.defaults.set(currencyIndex, forKey: Settings.defaultCurrency)
        Settings.defaults.synchronize()
    }
    
    class func getDefaultCurrency() -> Int {
        return Settings.defaults.integer(forKey: Settings.defaultCurrency)
        
    }
    
    class func setDefaultTip(tipIndex: Int) {
        Settings.defaults.set(tipIndex, forKey: Settings.defaultTip)
        Settings.defaults.synchronize()
    }
    
    class func getDefaultTip() -> Int {
        return Settings.defaults.integer(forKey: Settings.defaultTip)
    }
    
    class func setSavedTip(tipIndex: Int) {
        Settings.defaults.set(tipIndex, forKey: Settings.defaultTip)
        Settings.defaults.synchronize()
    }
    
    class func getSavedTip() -> Int {
        return Settings.defaults.integer(forKey: Settings.savedTip)
    }

    class func setSavedBill(savedBill: Double) {
        Settings.defaults.set(savedBill, forKey: Settings.savedBill)
        Settings.defaults.set(Date(), forKey: Settings.lastBillTimestamp)
        Settings.defaults.synchronize()
    }
    
    class func getSavedBill() -> Double {
        let now = NSDate()
        let lastBillTimestamp = Settings.defaults.object(forKey: Settings.lastBillTimestamp) as! Date?
        if lastBillTimestamp != nil {
            if now.timeIntervalSince(lastBillTimestamp!) > Settings.billAmountTTL {
                return 0
            } else {
                return Settings.defaults.double(forKey: Settings.savedBill)
            }
        }
        return 0
    }
}
