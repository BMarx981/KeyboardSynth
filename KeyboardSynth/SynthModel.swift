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
    var adsr: AKAmplitudeEnvelope?
    
    init() {
        osc = AKOscillatorBank(waveform: AKTable(.sawtooth),attackDuration: 0.3, decayDuration: 0.5, sustainLevel: 0.4, releaseDuration: 0.1,)
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
