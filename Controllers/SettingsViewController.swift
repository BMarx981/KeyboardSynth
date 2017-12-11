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
    
    var synth = SynthModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        synth.attack = attackValue
        synth.decay = decayValue
        synth.sustain = sustainValue
        synth.release = releaseValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attackSlider(_ sender: UISlider) {
        synth.attack = Double(sender.value)
        attackValue = Double(sender.value)
    }
    @IBAction func decaySlider(_ sender: UISlider) {
        synth.decay = Double(sender.value)
        decayValue = Double(sender.value)
    }
    @IBAction func sustainSlider(_ sender: UISlider) {
        synth.sustain = Double(sender.value)
        sustainValue = Double(sender.value)
    }
    @IBAction func releaseSlider(_ sender: UISlider) {
        synth.release = Double(sender.value)
        releaseValue = Double(sender.value)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("hello0")

        if segue.identifier == "KeyboardSegue" {
            
            let dest = segue.destination as? KeyboardViewController
            dest?.synthModel = synth
            dest?.attack = attackValue
            dest?.decay = decayValue
            dest?.sustain = sustainValue
            dest?.release = releaseValue
        }
    }
}
