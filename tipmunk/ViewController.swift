//
//  ViewController.swift
//  tipmunk
//
//  Created by Ryan Newton on 1/19/15.
//  Copyright (c) 2015 ___rvkn___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipValueSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Could just do this in the storyboard probably? But this works too
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshSliderFromUserDefaults()
        refreshDisplayedValues()
    }
    
    func refreshSliderFromUserDefaults() {
        // sets the min/max/default of tip slider based on the user's settings
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var minTip = Float(defaults.integerForKey("minTip"))
        var maxTip = Float(defaults.integerForKey("maxTip"))
        var defaultTip = Float(defaults.integerForKey("defaultTip"))

        tipValueSlider.minimumValue = minTip
        tipValueSlider.maximumValue = maxTip
        tipValueSlider.value = defaultTip
    }
    
    func refreshDisplayedValues() {
        var intTipValue = Int(tipValueSlider.value)
        let tipAmount = Double(tipValueSlider.value/100)

        // Maybe have a bill calculator class or func in another situation, but I think it's simple enough here
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipAmount
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipPercentageLabel.text = "\(intTipValue)%"

        // A tiny bit of animation so that the number flashes when it's changed
        self.totalLabel.alpha = 0
        UIView.animateWithDuration(0.5, animations: {
            self.totalLabel.alpha = 1
        })
    }

    @IBAction func billAmountFieldEntered(sender: AnyObject) {
        // clear the bill amount when the user enters the field, just a bit of UI functionality
        billField.text = ""
    }
    
    @IBAction func onAmountFieldChanged(sender: AnyObject) {
        refreshDisplayedValues()
    }
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        refreshDisplayedValues()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        // Allows the user to tap out of the keyboard
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

