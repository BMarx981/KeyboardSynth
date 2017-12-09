//
//  SettingsViewController.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/8/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var attackValue = 0.1
    var decayValue = 0.2
    var sustainValue = 0.5
    var releaseValue = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attackSlider(_ sender: UISlider) {
        attackValue = Double(sender.value)
    }
    @IBAction func decaySlider(_ sender: UISlider) {
        decayValue = Double(sender.value)
    }
    @IBAction func sustainSlider(_ sender: UISlider) {
        sustainValue = Double(sender.value)
    }
    @IBAction func releaseSlider(_ sender: UISlider) {
        releaseValue = Double(sender.value)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "KeyboardSegue" {
            let dest = segue.destination as? KeyboardViewController
            dest?.synthModel.osc?.attackDuration = attackValue
            dest?.synthModel.osc?.decayDuration = decayValue
            dest?.synthModel.osc?.sustainLevel = sustainValue
            dest?.synthModel.osc?.releaseDuration = releaseValue
        }
    }
}
