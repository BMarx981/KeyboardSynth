//
//  Filters.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/12/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import Foundation
import AudioKit

struct Filter {
    
    var lpf: AKLowPassFilter?
    var bpf: AKBandPassButterworthFilter?
    var hpf: AKHighPassFilter?
    var frequency = 0.0
    var resonance = 20.0
    var selectedFilter: Int?
    
    func setFilter(for osc: AKOscillatorBank, with selection: Int, at freq: Double, with resonance: Double) -> AKMixer {
        print("Filter frequency \(freq)")
        var filter = AKNode()

        switch selection {
        case 0:
            filter = getLPF(osc, at: freq, resonance: resonance)
        case 1:
            filter = getBPF(osc, at: freq, resonance: resonance)
        case 2:
            filter = getHPF(osc, at: freq, resonance: resonance)
        default:
            filter = getLPF(osc, at: freq, resonance: resonance)
        }
        return AKMixer(filter)
    }
    
    func getLPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKLowPassFilter {
        let lpf = AKLowPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
        lpf.start()
        return lpf
    }
    
    func getHPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKHighPassFilter {
        let hpf = AKHighPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
        hpf.start()
        return hpf
    }
    
    func getBPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKBandPassButterworthFilter {
        let bpf = AKBandPassButterworthFilter(osc, centerFrequency: freq, bandwidth: resonance)
        bpf.start()
        return bpf
    }
}

extension AKLowPassFilter {
    func setFrequency(to frequency: Double) {
        cutoffFrequency = frequency
    }
}

extension AKBandPassButterworthFilter {
    func setFrequency(to frequency: Double) {
        centerFrequency = frequency
    }
}

extension AKHighPassFilter {
    func setFrequency(to frequency: Double) {
        cutoffFrequency = frequency
    }
}

extension Filter {
    mutating func setFilterFreq(to freq: Double) {
        frequency = freq
    }
}

