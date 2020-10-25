//
//  ListViewController.swift
//  HomeTask5
//
//  Created by Владислав on 20.10.2020.
//

import UIKit

class ListViewController: UITableViewController {
    private let detailSegueId = "ShowCard"
    private let cellReuseIdentifier = "EmployeeCell"

    private var employees = [
        Employee(firstName: "Ivan", patronymic: "Ivanovich", lastName: "Ivanov", position: "sales manager"),
        Employee(firstName: "Ivan", patronymic: "Petrovich", lastName: "Pupkin", position: "top manager"),
        Employee(firstName: "Petr", patronymic: "Ivanovich", lastName: "Sergeev", position: "middle manager"),
        Employee(firstName: "Petr", patronymic: "Petrovich", lastName: "Petrov", position: "developer"),
        Employee(firstName: "Sergey", patronymic: "Vladimirovich", lastName: "Sidorov", position: "product owner")
    ]
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case detailSegueId:
            guard let vc = segue.destination as? CardViewController,
                let employee = sender as? Employee
            else { fatalError("Invalid data passed") }
            
            vc.employee
            //MARK:- TODO 1
            ///Передайте объект `employee`, который мы только что скастили из sender, на второй контроллер:
            ///(Не забудьте передать этот sender ниже, см. TODO 3)
            // vc.<employee variable> = ...
            
            //MARK:- TODO 2:
            ///У CardViewController есть ссылка на родителя, сделайте ее рабочей, присвоив в неё `self`:
            // vc.<parent variable> = ...

        default:
            break
        }
    }

    func updateUI() {
        tableView.reloadSections(IndexSet(arrayLiteral: 0), with: .automatic)
    }

}

//MARK:- Table View Data Source & Delegate
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let employee = employees[indexPath.row]
        
        cell.textLabel?.text = employee.fullName
        cell.detailTextLabel?.text = employee.position
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employees[indexPath.row]
        
        //MARK:- TODO 3:
        ///Передайте employee как sender
        performSegue(withIdentifier: detailSegueId, sender: employee)
    }
}
