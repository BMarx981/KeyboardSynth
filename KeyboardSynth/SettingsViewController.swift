//
//  SettingsViewController.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/8/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func didSetAttack(atck: Double)
    func didSetDecay(dec: Double)
    func didSetSustain(sus: Double)
    func didSetRelease(rel: Double)
}

class SettingsViewController: UIViewController {
    
    var delegate: SettingsDelegate?
    var attack = 0.0
    var decay = 0.0
    var sustain = 0.0
    var release = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attackSlider(_ sender: UISlider) {
        delegate?.didSetAttack(atck: Double(sender.value))
        attack = Double(sender.value)
    }
    @IBAction func decaySlider(_ sender: UISlider) {
        delegate?.didSetDecay(dec: Double(sender.value))
        decay = Double(sender.value)
    }
    @IBAction func sustainSlider(_ sender: UISlider) {
        delegate?.didSetSustain(sus: Double(sender.value))
        sustain = Double(sender.value)
    }
    @IBAction func releaseSlider(_ sender: UISlider) {
        delegate?.didSetRelease(rel: Double(sender.value))
        release = Double(sender.value)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "KeyboardSegue" {
            let dest = segue.destination as? KeyboardViewController
        }
    }
}
