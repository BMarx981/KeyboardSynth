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
    
    var osc: AKOscillator?
    var mixer: AKMixer?
    var adsr: AKAmplitudeEnvelope?
    
    init() {
        osc = AKOscillator(waveform: AKTable(.sawtooth))
        osc?.amplitude = 0.6
        adsr = AKAmplitudeEnvelope(osc)
        adsr?.start()
        mixer = AKMixer(adsr!)
        mixer?.start()
        
        AudioKit.output = mixer
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.frequency = noteNum
        adsr?.start()
        osc?.stop()
        osc?.start()
    }
}