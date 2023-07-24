//
//  ListSection.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import Foundation

enum ListSection {
    case suggestions([ListItem])
    case about([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .suggestions(let items),
                .about(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .suggestions:
            return "Öneriler"
        case .about:
            return "Aralıklı Oruç"
        }
    }
}
