//
//  ViewController.swift
//  Tipster
//
//  Created by Karan Khurana on 5/10/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultValue")
        tipSegment.selectedSegmentIndex = intValue
        
        if billText.text != "0" {
            let tipPercentages = [0.15, 0.18, 0.20]
            
            let bill = Double(billText.text!) ?? 0
            let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
            let total = bill + tip
            
            if (bill == 0) {
                UIView.animateWithDuration(0.2, animations: {
                    self.view2.alpha = 0
                })
            } else {
                tipLabel.text = String(format: "$%.2f", tip)
                totalLabel.text = String(format: "$%.2f", total)
                
                UIView.animateWithDuration(0.4, animations: {
                    self.view2.alpha = 1
                })
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        [billText.becomeFirstResponder()]
        
        self.view2.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapMain(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let bill = Double(billText.text!) ?? 0
        let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        if (bill == 0) {
            UIView.animateWithDuration(0.2, animations: {
                self.view2.alpha = 0
            })
        } else {
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
            UIView.animateWithDuration(0.4, animations: {
                self.view2.alpha = 1
            })
            
        }
        
    }
}

