//
//  SynthModel.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/7/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import Foundation
import AudioKit

protocol SynthModelDelegate {
    func didHitKey(_ synthModel: SynthModel, at index: IndexPath)
}

class SynthModel {
    
    var osc: AKOscillatorBank?
    var mixer: AKMixer?
    
    init() {
        osc = AKOscillatorBank(waveform: AKTable(.sawtooth),attackDuration: 0.3, decayDuration: 0.5, sustainLevel: 1.0, releaseDuration: 0.1)
        mixer = AKMixer(osc!)
        mixer?.start()
        
        AudioKit.output = mixer
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.play(noteNumber: MIDINoteNumber(48), velocity: MIDIVelocity(90), frequency: noteNum)
    }
}
