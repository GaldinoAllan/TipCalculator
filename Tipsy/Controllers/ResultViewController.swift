//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Allan on 14/03/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var tipValue: Float?
    var peopleToSplit: Int?
    var billValue: Float?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = calculate(billValue: billValue!, peopleToSplit: peopleToSplit!, tipValue: tipValue!)

        totalLabel.text = String(format: "%.2f", result)
        
        settingsLabel.text = "Split between \(peopleToSplit ?? 2) people, with \(tipValue! * 100)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func calculate(billValue: Float, peopleToSplit: Int, tipValue: Float) -> Float{
        let result = (billValue + (billValue * tipValue))/Float(peopleToSplit)
        return result
    }
}
