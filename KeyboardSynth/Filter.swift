//
//  Filters.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/12/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import Foundation
import AudioKit

class Filter {
    
    var lpf: AKLowPassFilter?
    var bpf: AKBandPassButterworthFilter?
    var hpf: AKHighPassFilter?
    var frequency: Double {
        willSet {
            lpf?.cutoffFrequency = (newValue)
            bpf?.centerFrequency = (newValue)
            hpf?.cutoffFrequency = (newValue)
        }
    }
    var resonance: Double {
        willSet {
            lpf?.resonance = (newValue)
            bpf?.bandwidth = (newValue)
            hpf?.resonance = (newValue)
        }
    }
    
    init(){
        frequency = 1000.0
        resonance = -20.0
    }
   
    func getLPF(_ osc: AKOscillatorBank?, at freq: Double, resonance: Double) -> AKLowPassFilter {
        let lpf = AKLowPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
        lpf.start()
        return lpf
    }
    
    func getHPF(_ osc: AKOscillatorBank?, at freq: Double, resonance: Double) -> AKHighPassFilter {
        let hpf = AKHighPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
        hpf.start()
        return hpf
    }
    
    func getBPF(_ osc: AKOscillatorBank?, at freq: Double, resonance: Double) -> AKBandPassButterworthFilter {
        let bpf = AKBandPassButterworthFilter(osc, centerFrequency: freq, bandwidth: resonance)
        bpf.start()
        return bpf
    }
}

extension AKLowPassFilter {
    func setFrequency(to frequency: Double) {
        cutoffFrequency = frequency
    }
    
    func setResonance(to frequency: Double) {
        resonance = frequency
    }
}

extension AKBandPassButterworthFilter {
    func setFrequency(to frequency: Double) {
        centerFrequency = frequency
    }
    
    func setResonance(to frequency: Double) {
        bandwidth = frequency
    }
}

extension AKHighPassFilter {
    func setFrequency(to frequency: Double) {
        cutoffFrequency = frequency
    }
    
    func setResonance(to frequency: Double) {
        resonance = frequency
    }
}

extension Filter {
    func setFilterFreq(to freq: Double) {
        self.frequency = freq
    }
    
    func setFilterRes(to freq: Double) {
        resonance = freq
    }
}

