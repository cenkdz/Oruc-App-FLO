//
//  WeightTrackerVM.swift
//  Oruc
//
//  Created by Cenk Donmez on 11.07.2023.
//

import Foundation

struct BMI{
    
}

class WeightTrackerVM{
    var progress: ObservableObj<TimeInterval?> = ObservableObj(nil)
    
    func getBmiDescription(bmi: Decimal) -> String{
        switch bmi {
        case 0..<18.5:
            return ("Normale göre zayıfsınız.")
        case 18.5..<25.0:
            return ("Sağlıklı kilodasınız.")
        case 25.0...:
            return ("Şişman kategorisindesiniz.")
        default:
            return ""
        }
    }
}
