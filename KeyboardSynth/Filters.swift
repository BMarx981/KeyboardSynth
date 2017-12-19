//
//  Filters.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/12/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import Foundation
import AudioKit

class Filter: AKNode {
    
    var lpf: AKLowPassFilter?
    var bpf: AKBandPassButterworthFilter?
    var hpf: AKHighPassFilter?
    var filter: AKNode?
    var frequency = 0.0
    var resonance = 0.0
    var selectedFilter: Int?
    
    override init() {
        super.init()
    }
    
    init(osc: AKOscillatorBank, filterType: Int, freq: Double, res: Double) {
        super.init()

        setFilter(for: osc, with: filterType)
        self.frequency = freq
        self.resonance = res
    }
    
    func setFilter(for osc: AKOscillatorBank, with selection: Int) {
        selectedFilter = selection
        switch selection {
        case 0:
            filter = getLPF(osc, at: frequency, resonance: resonance)
        case 1:
            filter = getBPF(osc, at: frequency, resonance: resonance)
        case 2:
            filter = getHPF(osc, at: frequency, resonance: resonance)
        default:
            filter = getLPF(osc, at: frequency, resonance: resonance)
        }
    }
    
    func getLPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKLowPassFilter {
        return AKLowPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
    }
    
    func getHPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKHighPassFilter {
        return AKHighPassFilter(osc, cutoffFrequency: freq, resonance: resonance)
    }
    
    func getBPF(_ osc: AKOscillatorBank, at freq: Double, resonance: Double) -> AKBandPassButterworthFilter {
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

extension Filter {
    func setFilterFreq(to freq: Double) {
        frequency = freq
    }
}

