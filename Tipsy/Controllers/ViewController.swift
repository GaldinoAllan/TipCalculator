//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipSelected = 0
    var tipValue:Float = 0.0
    var peopleToSplit = 2
    var billValue:Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        // getting the text the user has inputted
        let billText = (billTextField.text! as NSString).floatValue
        billValue = billText
        
        // dismissing the keyboard
        billTextField.endEditing(true)
        
        // setting all the values to false, so no button is selected
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // selecting the button the user taps
        sender.isSelected = true
        
        // setting the variable tipSelected to the right number
        tipSelected = sender.tag
        // 0 = 0%
        // 1 = 10%
        // 2 = 20%
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // setting the label to the right ammount to split in the integer format for strings
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        //setting the variable peopleToSplit to the right value in the Integer format
        peopleToSplit = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // verifying the tip selected for the value to be correct
        // 0 =  0% = 0.0
        // 1 = 10% = 0.1
        // 2 = 20% = 0.2
        if tipSelected == 0{
            tipValue = 0.0
        } else if tipSelected == 1{
            tipValue = 0.1
        } else {
            tipValue = 0.2
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billValue = billValue
            destinationVC.peopleToSplit = peopleToSplit
            destinationVC.tipValue = tipValue
        }
    }
    
}

