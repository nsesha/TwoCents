//
//  SettingsViewController.swift
//  TwoCents
//
//  Created by admin on 3/5/17.
//  Copyright © 2017 Seshadri N. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var defaultCurrencyControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipControl.selectedSegmentIndex = SettingsCookie.getDefaultTip()
        defaultCurrencyControl.selectedSegmentIndex = SettingsCookie.getDefaultCurrency()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onCurrencyChange(_ sender: Any) {
        SettingsCookie.setDefaultCurrency(currencyIndex: defaultCurrencyControl.selectedSegmentIndex)
    }
    
    @IBAction func onTipChange(_ sender: Any) {
        SettingsCookie.setDefaultTip(tipIndex: defaultTipControl.selectedSegmentIndex)
    }
}
