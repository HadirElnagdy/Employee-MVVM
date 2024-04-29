//
//  Employee.swift
//  Employee-MVVM
//
//  Created by Hadir on 28/04/2024.
//

import Foundation

struct EmployeeResponse: Codable{
    let status: String?
    let data: [Employee]?
    
}
struct Employee: Codable{
    var id: Int?
    var name: String?
    var age: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case age = "employee_age"
    }
}
