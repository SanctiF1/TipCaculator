//
//  ViewController.swift
//  tips
//
//  Created by Toan Vo on 11/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var btnSetting: UIButton!
    var defIndex = 0;
    var defStyle = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$0.00"
        totalLabel.text = "$0.00"
        let defaults = NSUserDefaults.standardUserDefaults();
        defIndex = Int(defaults.integerForKey("defIndex"))
        defStyle = defaults.integerForKey("defStyle");
        tipControl.selectedSegmentIndex = defIndex
        
        if( defStyle == 0)
        {
            view.backgroundColor = UIColor.whiteColor()
        }
        else{
            view.backgroundColor = UIColor.darkGrayColor()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openSettingSegue")
        {
            let des = segue.destinationViewController as! SettingViewController
            //var tipPercentage
            //= tipPercentages[tipControl.selectedSegmentIndex]
            
            //des.val1 = tipControl.valueForKey(<#T##key: String##String#>)
            
        }
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage
        = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        //var billAmount = Double(billField.text! )!
        var billAmount = (billField.text! as NSString).doubleValue

        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
 
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

