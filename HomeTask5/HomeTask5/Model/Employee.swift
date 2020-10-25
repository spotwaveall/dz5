//
//  Employee.swift
//  HomeTask5
//
//  Created by Владислав on 20.10.2020.
//

import Foundation

class Employee {
    var firstName: String
    var lastName: String
    var patronymic: String
    var position: String
    
    init(firstName: String, patronymic: String, lastName: String, position: String) {
        self.firstName = firstName
        self.patronymic = patronymic
        self.lastName = lastName
        self.position = position
    }
    
    var fullName: String {
        "\(lastName) \(firstName) \(patronymic)"
    }
}
