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
    
    var attack = 0.0
    var decay = 0.0
    var sustain = 0.0
    var release = 0.0
    
    init() {
        osc = AKOscillator(waveform: AKTable(.sawtooth))
        adsr = AKAmplitudeEnvelope(osc!)
        AudioKit.output = adsr
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.frequency = noteNum
        adsr?.attackDuration = attack
        adsr?.decayDuration = decay
        adsr?.sustainLevel = sustain
        adsr?.releaseDuration = release
        adsr?.start()
        osc?.start()
    }
    
    func stopKey() {
        adsr?.stop()
    }
}
