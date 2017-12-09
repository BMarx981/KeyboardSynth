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

class SynthModel: SettingsDelegate {
    
    var osc: AKOscillatorBank?
    var mixer: AKMixer?
    var attack = 0.0
    var decay = 0.0
    var sustain = 0.0
    var release = 0.0
    
    init() {
        osc = AKOscillatorBank()
        mixer = AKMixer()
    }
    
    init(ack: Double, dec: Double, sus: Double, rel: Double) {
        osc = AKOscillatorBank(waveform: AKTable(.sawtooth),attackDuration: ack, decayDuration: dec, sustainLevel: rel, releaseDuration: 0.1)
        mixer = AKMixer(osc!)
        mixer?.start()
        AudioKit.output = mixer
        AudioKit.start()
    }
    
    deinit {
        osc = nil
        mixer = nil
        AudioKit.stop()
    }
    
    func playKey(noteNum: Int) {
        osc?.play(noteNumber: MIDINoteNumber(noteNum), velocity: MIDIVelocity(127))
    }
    
    func stopNote(noteNum: Int) {
        osc?.stop(noteNumber: MIDINoteNumber(noteNum))
    }
    
    func didSetAttack(atck: Double) {
        attack = atck
    }
    
    func didSetDecay(dec: Double) {
        decay = dec
    }
    
    func didSetSustain(sus: Double) {
        sustain = sus
    }
    
    func didSetRelease(rel: Double) {
        release = rel
    }
    
}
