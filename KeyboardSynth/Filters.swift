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
    var frequency = 0.0
    var selectedFilter: Int?
    var filterArray = [Any?]()
    
    init() {
        filterArray.append(lpf)
        filterArray.append(bpf)
        filterArray.append(hpf)
    }
    
    func setFilterFreq(freq: Double) {
        if let num = selectedFilter {
            let filter = filterArray[num] as? AKLowPassFilter
            filter?.setFrequency(with: freq)
        }
    }
}

extension AKLowPassFilter {
    func setFrequency(with frequency: Double) {
        cutoffFrequency = frequency
    }
}

extension AKBandPassButterworthFilter {
    func setFrequency(with frequency: Double) {
        centerFrequency = frequency
    }
}

extension AKHighPassFilter {
    func setFrequency(with frequency: Double) {
        cutoffFrequency = frequency
    }
}
