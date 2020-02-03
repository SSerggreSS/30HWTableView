//
//  StudentCategories.swift
//  30HWTableView
//
//  Created by Сергей on 01.02.2020.
//  Copyright © 2020 Sergei. All rights reserved.
//

import Foundation

enum StudentCategories: String {
    
    case honoursPupil = "Honours Pupil"
    case goodies      = "Goodies"
    case triples      = "Triples"
    case dvoechniks   = "Dvoechniks"
    
    func priority() -> Int {
        
        var priority = 0
        
        switch self {
        case .honoursPupil:
            priority = 0
        case .goodies:
            priority = 1
        case .triples:
            priority = 2
        case .dvoechniks:
            priority = 3
        }
        
        return priority
    }
    
}
