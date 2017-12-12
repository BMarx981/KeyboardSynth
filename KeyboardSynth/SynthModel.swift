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
    
    var attackValue = 0.0
    var decayValue = 0.0
    var sustainValue = 0.0
    var releaseValue = 0.0
    var amp = 127
    
    var osc: AKOscillatorBank?
    var mixer: AKMixer?
    
    init() {
        osc = AKOscillatorBank(waveform: AKTable(.sawtooth))
        osc?.attackDuration = attackValue
        osc?.decayDuration = decayValue
        osc?.sustainLevel = sustainValue
        osc?.releaseDuration = releaseValue
        mixer = AKMixer(osc!)
        mixer?.start()
        
        AudioKit.output = mixer
        AudioKit.start()
    }
    
    func playKey(noteNum: Double) {
        osc?.attackDuration = attackValue
        osc?.decayDuration = decayValue
        osc?.sustainLevel = sustainValue
        osc?.releaseDuration = releaseValue
        osc?.play(noteNumber: MIDINoteNumber(noteNum), velocity: MIDIVelocity(amp))

    }
    
    func stopKey(_ noteNum: Int) {
        osc?.stop(noteNumber: MIDINoteNumber(noteNum))
    }
}
