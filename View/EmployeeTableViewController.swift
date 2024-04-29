//
//  EmployeeTableViewController.swift
//  Employee-MVVM
//
//  Created by Hadir on 28/04/2024.
//

import UIKit

class EmployeeTableViewController: UITableViewController {

    var employees = [Employee]()
    let viewModel = EmployeeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.bindResultToViewController = { () in self.renderToView()}
        viewModel.fetchData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = employees[indexPath.row].name

        return cell
    }
    
    func renderToView() {
        DispatchQueue.main.async {
            self.employees = self.viewModel.vmResult
            self.tableView.reloadData()
        }
    }

}
