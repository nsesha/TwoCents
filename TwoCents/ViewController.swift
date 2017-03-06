//
//  ViewController.swift
//  TwoCents
//
//  Created by admin on 3/4/17.
//  Copyright © 2017 Seshadri N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var numPersonField: UITextField!
    @IBOutlet weak var perPersonLabel1: UILabel!
    @IBOutlet weak var perPersonLabel2: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        /*
        let formatter = NumberFormatter()
        
        for locale in NSLocale.availableLocaleIdentifiers {
            print("\(locale)")
            formatter.locale = NSLocale(localeIdentifier: locale) as Locale!
            print("\(formatter.currencyCode) =  \(formatter.currencySymbol)")
            let symbol = String(format: "\(formatter.currencySymbol)")
            print("\t\t\(symbol)")
        }
        
        */
    }

    @IBAction func calculateTip(_ sender: Any) {
        let currencies = ["en_US", "en_JE", "en_EE", "en_INR", "en_CN"]
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tipIndex = tipControl.selectedSegmentIndex
        var tipPercent = tipPercentages[0]
        
        let numPersons = Int(numPersonField.text!) ?? 0
        
        if tipIndex == 3 {
            customTipField.isHidden = false
            tipPercent = Double(customTipField.text!) ?? 0
            tipPercent = tipPercent / 	100
        } else {
            customTipField.isHidden = true
            tipPercent = Double(tipPercentages[tipIndex])
        }
        
        var tip = bill * Double(tipPercent)
        var total = bill + tip
        
        if numPersons > 1 {
            perPersonLabel1.isHidden = false
            perPersonLabel2.isHidden = false
            tip = tip / Double(numPersons)
            total = total / Double(numPersons)
        } else {
            perPersonLabel1.isHidden = true
            perPersonLabel2.isHidden = true
        }
        
        let symbol = getSymbol(currency: currencies[0])
        tipLabel.text = String(format: "\(symbol) %.2f", tip)
        totalLabel.text = String(format: "\(symbol) %.2f", total)
    }

    func getSymbol(currency: String) -> String{
        let formatter = NumberFormatter()
        
        formatter.locale = NSLocale(localeIdentifier: currency) as Locale!
        return formatter.currencySymbol
    }
    
}
