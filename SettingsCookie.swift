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
}
