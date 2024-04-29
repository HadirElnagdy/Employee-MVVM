//
//  EmployeeViewModel.swift
//  Employee-MVVM
//
//  Created by Hadir on 28/04/2024.
//

import Foundation

class EmployeeViewModel{
    var vmResult : [Employee]!{
        didSet{
            bindResultToViewController()
        }
    }
    
    func fetchData(){
        Service.fetchDataFromNetwork{[weak self] result in
            self?.vmResult = result?.data
        }
    }
    
    var bindResultToViewController: (()->()) = {
        
    }
}
