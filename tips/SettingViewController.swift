//
//  SettingViewController.swift
//  tips
//
//  Created by Toan Vo on 11/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit
import Foundation

class SettingViewController: UIViewController {

    
    @IBOutlet weak var txtVal1: UITextField!
    
    @IBOutlet weak var txtVal2: UITextField!
    @IBOutlet weak var txtVal3: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
   
    @IBOutlet weak var styleControl: UISegmentedControl!
   
    static var defTipIndex = 0;
    static var darkStyle = false;
    var defIndex = 0;
    var defStyle = 0;
    
    @IBOutlet weak var tipSetting: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    @IBAction func onSetdefaultValue(sender: AnyObject) {
      // defTipIndex = tipSetting.selectedSegmentIndex
       defIndex = tipSetting.selectedSegmentIndex
        defStyle = styleControl.selectedSegmentIndex
    
    }

    @IBAction func onTapOk(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setInteger(defIndex, forKey:"defIndex")
        defaults.setInteger(defStyle, forKey:"defStyle");
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
