//
//  NetworkService.swift
//  Employee-MVVM
//
//  Created by Hadir on 28/04/2024.
//

import Foundation


protocol NetworkService{
    static func fetchDataFromNetwork(completion: @escaping (EmployeeResponse?)->Void)
}

class Service: NetworkService{
    
    static func fetchDataFromNetwork(completion: @escaping (EmployeeResponse?) -> Void) {
        let optionalUrl = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
        guard let url = optionalUrl else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){data, response, error in
            guard let data = data else { return  }
            do{
                let result = try JSONDecoder().decode(EmployeeResponse.self, from: data)
                completion(result)
            }catch{
                print(error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    
}
