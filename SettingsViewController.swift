//
//  SettingsViewController.swift
//  tipmunk
//
//  Created by Ryan Newton on 1/21/15.
//  Copyright (c) 2015 ___rvkn___. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipMinField: UITextField!
    @IBOutlet weak var tipMaxField: UITextField!
    @IBOutlet weak var tipDefaultField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()

        let maxTip = Float(defaults.integerForKey("maxTip"))
        let minTip = Float(defaults.integerForKey("minTip"))
        let defaultTip = Float(defaults.integerForKey("defaultTip"))
        
        tipMinField.text = String(defaults.integerForKey("minTip"))
        tipMaxField.text = String(defaults.integerForKey("maxTip"))
        tipDefaultField.text = String(defaults.integerForKey("defaultTip"))
    }
    
    func saveNewSettings() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // In case the user leaves the field blank
        if let newMinValue = tipMinField.text?.toInt() {
            defaults.setInteger(newMinValue, forKey: "minTip")
        } else {
            defaults.setInteger(15, forKey: "minTip")
        }
        
        if let newMaxValue = tipMaxField.text?.toInt() {
            defaults.setInteger(newMaxValue, forKey: "maxTip")
        } else {
            defaults.setInteger(25, forKey: "maxTip")
        }
        
        if let newDefaultValue = tipDefaultField.text?.toInt() {
            defaults.setInteger(newDefaultValue, forKey: "defaultTip")
        } else {
            defaults.setInteger(18, forKey: "defaultTip")
        }
        
        defaults.synchronize()
    }

    @IBAction func saveSettingsClicked(sender: AnyObject) {
        saveNewSettings()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
