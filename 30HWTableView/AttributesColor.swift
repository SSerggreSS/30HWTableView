//
//  Attribute.swift
//  30HWTableView
//
//  Created by Сергей on 01.02.2020.
//  Copyright © 2020 Sergei. All rights reserved.
//

import Foundation
import UIKit

class AttributesColor {
    
    var name: String
    var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
    init() {
        name = ""
        color = UIColor()
    }
    
   static var randomColor: UIColor {
        return UIColor.randomColor
    }
    
    
    static func randomAttributesColors(count: Int) -> [AttributesColor] {
        var attributesResult = [AttributesColor]()
        
        var componentsRGB = UIColor.yellow.cgColor.components
        
        for _ in 1...count {
            
            let attributeColor = AttributesColor()
            attributeColor.color = UIColor.randomColor
            
            componentsRGB = attributeColor.color.cgColor.components
            
            let r = componentsRGB?[0] ?? 0.0
            let g = componentsRGB?[1] ?? 0.0
            let b = componentsRGB?[2] ?? 0.0
            let a = componentsRGB?[3] ?? 0.0
            
            attributeColor.name = String.init(format: "  Red:%.2f, Green:%.2f, Blue:%.2f, Alpha:%.2f", r, g, b, a)
            
            attributesResult.append(attributeColor)
            
        }
        
        return attributesResult
    }
    
}
