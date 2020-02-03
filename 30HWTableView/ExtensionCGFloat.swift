//
//  ExtensionCGFloat.swift
//  30HWTableView
//
//  Created by Сергей on 31.01.2020.
//  Copyright © 2020 Sergei. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    static var random: CGFloat {
        return CGFloat.random(in: 0...1)
    }
    
    var round: String {
        
        return String(format: "%.2f", self)
        
    }
    
}

