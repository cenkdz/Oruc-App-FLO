//
//  Timer.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import Foundation

enum FTimerType{
    case DefaultTimer
    case OverTimeTimer
}

struct FTimer{
    var timer: Timer?
    var startDate, endDate: Date?
    var isInvalidated, didFinish: Bool?
    var program: FProgram?
    var scenario: FScenario?
    var type: FTimerType?
}
