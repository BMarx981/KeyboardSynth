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
    func didStopKey(_ synthModel: SynthModel, at index: IndexPath)
}

class SynthModel {
    
    var osc: AKOscillator?
    var mixer: AKMixer?
    var adsr: AKAmplitudeEnvelope?
    
    
    init() {
        osc = AKOscillator(waveform: AKTable(.sawtooth))
        osc?.amplitude = 0.6

        adsr = AKAmplitudeEnvelope(osc!)

        
        AudioKit.output = adsr
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.frequency = noteNum
        adsr?.attackDuration = 0.3
        adsr?.decayDuration = 0.9
        adsr?.sustainLevel = 0.3
        adsr?.releaseDuration = 0.5
        adsr?.start()
        osc?.start()
    }
    
    func stopKey() {
        adsr?.stop()
    }
}
