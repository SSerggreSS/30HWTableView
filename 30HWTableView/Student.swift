//
//  Student.swift
//  30HWTableView
//
//  Created by Сергей on 01.02.2020.
//  Copyright © 2020 Sergei. All rights reserved.
//

import Foundation
import UIKit

class Student {

    var name: String
    var lastName: String
    var assessment: Int
    var color: UIColor?

    init(name: String, lastName: String, assessment: Int, nameColor: UIColor?) {
        
        self.name = name
        self.lastName = lastName
        self.assessment = assessment
        let color = assessment < 4 ? UIColor.red : UIColor.blue
        self.color = nameColor ?? color
        
    }
    
    init() {
        self.name = ""
        self.lastName = ""
        self.assessment = 0
        let color = UIColor.blue
        self.color = color
    }
    
    static func studentsByCategory() -> [StudentCategories: [Student]] {
        
            var studentsByCategory = [StudentCategories: [Student]]()
            var honoursPupilStuds = [Student]()
            var goodiesStuds      = [Student]()
            var triplesStuds      = [Student]()
            var dvoechniksStuds   = [Student]()
        
            let students = Student.randomStudents()
            
            for student in students {
                
                switch student.assessment {
                case 5:
                    honoursPupilStuds.append(student)
                    studentsByCategory[StudentCategories.honoursPupil] = honoursPupilStuds
                case 4:
                    goodiesStuds.append(student)
                    studentsByCategory[StudentCategories.goodies] = goodiesStuds
                case 3:
                    triplesStuds.append(student)
                    studentsByCategory[StudentCategories.triples] = triplesStuds
                case 2:
                    dvoechniksStuds.append(student)
                    studentsByCategory[StudentCategories.dvoechniks] = dvoechniksStuds
                default:
                    break
                }
            
        }
        
        return studentsByCategory
    }
    
    
    static func randomStudents() -> [Student] {
        var students = [Student]()
                
        let names = ["Mason", "Ethan", "Logan", "Lucas", "Jackson",
                     "Aiden", "Oliver", "Jacob", "Madison", "Liam",
                     "Emma", "Olivia", "Ava", "Sophia", "Isabella",
                     "Mia", "Charlotte", "Amelia", "Emily", "Sofia",
                     "Daniel", "Ellie", "Carter", "Aubrey", "Gabriel",
                      "Scarlett", "Henry", "Zoey", "Matthew","Hannah"]
        
        let lastNames = ["Johnson", "Williams", "Jones", "Brown", "Davis",
                         "Miller", "Wilson", "Moore", "Taylor", "Anderson",
                         "Thomas", "Jackson", "White", "Harris", "Martin",
                         "Thompson", "Wood", "Lewis", "Scott", "Hill",
                         "Cooper", "King", "Green", "Walker", "Edwards",
                         "Turner", "Morgan", "Baker", "Hill", "Phillips"]
    
        let randomNumbers = Int.randomNotRepeatNumber(in: 0...names.count - 1)
        
        for i in randomNumbers {
            students.append(Student(name: names[i], lastName: lastNames[i],
                                    assessment: Int.random(in: 2...5), nameColor: nil))
        }
        
        students.sort { (studentFirst, studentSecond) -> Bool in
            return studentFirst.lastName < studentSecond.lastName
        }

        return students
    }
    
    static func sortedStudentsByCategories(at first: ProgressOfStudents) -> [StudentCategories] {
        let studentsByCategory = Student.studentsByCategory()
        var sordKeys = [StudentCategories]()
        
        if first == .good {
            let resultSord = studentsByCategory.sorted { $0.key.priority() < $1.key.priority()}
            sordKeys = resultSord.map({$0.key})
        } else if first == .bad {
            let resultSord = studentsByCategory.sorted { $0.key.priority() > $1.key.priority()}
            sordKeys = resultSord.map({$0.key })
        }
        
        return sordKeys
    }
           
    
}
