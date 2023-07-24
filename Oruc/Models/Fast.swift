//
//  Fast.swift
//  Oruc
//
//  Created by Cenk Donmez on 10.07.2023.
//

import Foundation


struct Fast: Identifiable, Decodable{
    let id = UUID()
    let startDate: Date
    let endDate: Date
    let duration: TimeInterval
}
