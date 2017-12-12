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
    
    var attackValue = 0.0
    var decayValue = 0.0
    var sustainValue = 0.0
    var releaseValue = 0.0
    var amp = 1.0
    
    var osc: AKOscillator?
    var mixer: AKMixer?
    var adsr: AKAmplitudeEnvelope?
    
    init() {
        osc = AKOscillator(waveform: AKTable(.sawtooth))
        osc?.amplitude = amp
        osc?.start()
        mixer = AKMixer(osc!)
        mixer?.start()
        adsr = AKAmplitudeEnvelope(mixer!)
        
        AudioKit.output = adsr
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.frequency = noteNum
        
        adsr?.attackDuration = attackValue
        adsr?.decayDuration = decayValue
        adsr?.sustainLevel = sustainValue
        adsr?.releaseDuration = releaseValue
        print(attackValue)
        adsr?.start()
    }
    
    func stopKey() {
        adsr?.stop()
    }
}
