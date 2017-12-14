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
    var filter: AKNode?
    var frequency = 0.0
    var resonance = 0.0
    var selectedFilter: Int?
    
    init() {
    }
    
    init(osc: AKOscillatorBank, filterType: Int, freq: Double, res: Double) {
        selectedFilter = filterType
        switch filterType {
        case 0:
            filter = setLPF(osc, at: freq, resonance: res)
        case 1:
            filter = setBPF(osc, at: freq, resonance: res)
        case 2:
            filter = setHPF(osc, at: freq, resonance: res)
        default:
            filter = setLPF(osc, at: freq, resonance: res)
        }
    }
    
    func setLPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKLowPassFilter {
        return AKLowPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
    }
    
    func setHPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKHighPassFilter {
        return AKHighPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
    }
    
    func setBPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKBandPassButterworthFilter {
        return AKBandPassButterworthFilter(osc, centerFrequency: freq, bandwidth: resonance)
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
