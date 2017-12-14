//
//  FilterFactory.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/14/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import Foundation
import AudioKit

struct FilterType {
    
    var frequency: Double
    var resonance: Double
    
    enum filter {
        case lpf
        case bpf
        case hpf
    }
}

protocol filterFrequencys {
    func setFilterFrequency(with freq: Double)
    func setResonanceFrequency(with freq: Double)
    func bypassFilter()
}

class LowPassFilter: AKLowPassFilter, filterFrequencys {
    var frequency: Double
    var res: Double
    
    init() {
        frequency = 0.0
        res = 0.0
    }
    
    init(freq: Double, res: Double) {
        frequency = freq
        self.res = res
    }
    
    func setFilterFrequency(with freq: Double) {
        frequency = freq
    }
    
    func setResonanceFrequency(with freq: Double) {
        res = freq
    }
    
    func bypassFilter() {
        bypass()
    }
}

class BandPassFilter: AKBandPassButterworthFilter, filterFrequencys {
    
    var frequency: Double
    var res: Double
    
    init() {
        frequency = 0.0
        res = 0.0
    }
    
    init(freq: Double, res: Double) {
        frequency = freq
        self.res = res
    }
    
    func setFilterFrequency(with freq: Double) {
        centerFrequency = freq
    }
    
    func setResonanceFrequency(with freq: Double) {
        bandwidth = freq
    }
    
    func bypassFilter() {
        bypass()
    }
}

class HighPassFilter: AKHighPassFilter, filterFrequencys {
    
    var frequency: Double
    var res: Double
    
    init() {
        frequency = 0.0
        res = 0.0
    }
    
    init(freq: Double, res: Double) {
        frequency = freq
        self.res = res
    }
    
    func setFilterFrequency(with freq: Double) {
        frequency = freq
    }
    
    func setResonanceFrequency(with freq: Double) {
        res = freq
    }
    
    func bypassFilter() {
        bypass()
    }
}
