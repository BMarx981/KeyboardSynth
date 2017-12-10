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
    func didStopKey(_ synthModel: SynthModel)
}

class SynthModel {
    
    var osc: AKOscillator?
    var mixer: AKMixer?
    var adsr: AKAmplitudeEnvelope?
    
    init() {
        osc = AKOscillator(waveform: AKTable(.sawtooth))
        osc?.amplitude = 0.8
        
        mixer = AKMixer(osc!)
        mixer?.start()
        adsr = AKAmplitudeEnvelope(mixer!)
        adsr?.attackDuration = 0.1
        adsr?.decayDuration = 0.3
        adsr?.sustainLevel = 1.0
        adsr?.releaseDuration = 0.1
        adsr?.start()
        
        AudioKit.output = adsr
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.frequency = noteNum
        osc?.start()
        adsr?.start()
    }
    
    func stopKey() {
        osc?.amplitude = 0.0
    }
}
