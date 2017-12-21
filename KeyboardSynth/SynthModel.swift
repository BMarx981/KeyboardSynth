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
    var filterFrequency = 2000.0
    var resFreq = -20.0
    var amp = 127
    var typeSelection = 0
    var filter = Filter()
    var oscSelection = 0
    var osc: AKOscillatorBank?
    var filterMixer = AKMixer()
    var lpf = AKLowPassFilter()
    var bpf = AKBandPassButterworthFilter()
    var hpf = AKHighPassFilter()
    
    init() {
        osc = AKOscillatorBank(waveform: AKTable(.sawtooth))
        osc? = getOscType(with: oscSelection)
        osc?.attackDuration = attackValue
        osc?.decayDuration = decayValue
        osc?.sustainLevel = sustainValue
        osc?.releaseDuration = releaseValue
        
        switch typeSelection {
        case 0:
            lpf = filter.getLPF(osc!, at: filterFrequency, resonance: resFreq)
            filterMixer.connect(input: lpf)
        case 1:
            bpf = filter.getBPF(osc!, at: filterFrequency, resonance: resFreq)
            filterMixer.connect(input: bpf)
        case 2:
            hpf = filter.getHPF(osc!, at: filterFrequency, resonance: resFreq)
            filterMixer.connect(input: hpf)
        default:
            lpf = filter.getLPF(osc!, at: filterFrequency, resonance: resFreq)
            filterMixer.connect(input: lpf)
            lpf.bypass()
        }

        AudioKit.output = filterMixer
        AudioKit.start()
    }
    
    func getOscType(with selection: Int) -> AKOscillatorBank {
        var osc = AKOscillatorBank(waveform: AKTable(.sawtooth))
        switch selection {
        case 0:
            osc = AKOscillatorBank(waveform: AKTable(.sawtooth))
        case 1:
            osc = AKOscillatorBank(waveform: AKTable(.square))
        case 2:
            osc = AKOscillatorBank(waveform: AKTable(.sine))
        case 3:
            osc = AKOscillatorBank(waveform: AKTable(.triangle))
        default:
            osc = AKOscillatorBank(waveform: AKTable(.sawtooth))
        }
        return osc
    }
    
    func playKey(noteNum: Double) {
        lpf.setFrequency(to: filterFrequency)
        bpf.setFrequency(to: filterFrequency)
        hpf.setFrequency(to: filterFrequency)
        lpf.setResonance(to: resFreq)
        bpf.setResonance(to: resFreq)
        hpf.setResonance(to: resFreq)
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
