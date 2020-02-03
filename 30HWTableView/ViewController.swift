//
//  ViewController.swift
//  30HWTableView
//
//  Created by Сергей on 31.01.2020.
//  Copyright © 2020 Sergei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var attributesColor = [String: [AttributesColor]]()
    var students = [Student]()
    let studentsByCategory = Student.studentsByCategory()
    let sortedKeys = Student.sortedStudentsByCategories(at: .good)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        students = Student.randomStudents()

        attributesColor["AttributesColor"] = AttributesColor.randomAttributesColors(count: 1000)
        
    
    }

    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sortedKeys.count + attributesColor.count
       }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return section < sortedKeys.count ? sortedKeys[section].rawValue : "Attributes Color"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        var countRows = 0
        
        if section < (sortedKeys.count) {
            countRows = sortedKeys.count
        } else {
            countRows = attributesColor["AttributesColor"]?.count ?? 0
        }
       
        return countRows
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        var resultCell = UITableViewCell()
        
        if indexPath.section < sortedKeys.count {
            
        let indentifierStudentCell = "indentifierStudentCell"
        
        var studentCell = tableView.dequeueReusableCell(withIdentifier: indentifierStudentCell)
        studentCell = studentCell ?? UITableViewCell(style: .value1, reuseIdentifier: indentifierStudentCell)
            
        let key = sortedKeys[indexPath.section]
        let student = studentsByCategory[key]?[indexPath.row] ?? Student()
            
        studentCell?.textLabel?.textColor = student.color
        studentCell?.textLabel?.text = "\(student.lastName) \(student.name)"
        studentCell?.detailTextLabel?.textColor = student.color
        studentCell?.detailTextLabel?.text = String(student.assessment)
        resultCell = studentCell ?? UITableViewCell()
            
        } else {
            
            let indentifierColorCell = "indentifierColorCell"
            
            let attributeColor = attributesColor["AttributesColor"]?[indexPath.row]
            
            var colorCell = tableView.dequeueReusableCell(withIdentifier: indentifierColorCell)
            colorCell = colorCell ?? UITableViewCell(style: .default, reuseIdentifier: indentifierColorCell)
            colorCell?.textLabel?.backgroundColor = attributeColor?.color
            colorCell?.textLabel?.text = attributeColor?.name
            resultCell = colorCell ?? UITableViewCell()
            
        }
        
        return resultCell
    }

}
