//
//  FScenario.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import Foundation
// f -> Fasting
// o -> Overtime
public enum FScenario {
    case fTimerNotSet
    case fTimerStartedFirstTime
    case fTimerStarted
    //Timer ended by user
    case fTimerEndedByUser
    case fTimerEndedByItself
    case fTimeRunningOvertime
}
