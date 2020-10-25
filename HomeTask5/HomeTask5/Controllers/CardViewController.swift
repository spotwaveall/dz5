//
//  CardViewController.swift
//  HomeTask5
//
//  Created by Владислав on 19.10.2020.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK:- TODO 4:
    ///Добавьте всем outlets модификатор доступа `private`, чтобы к ним нельзя было получить доступ напрямую вне этого контроллера
    @IBOutlet private weak var lastNameField: UITextField!
    @IBOutlet private weak var firstNameField: UITextField!
    @IBOutlet private weak var patronymicField: UITextField!
    @IBOutlet private weak var positionField: UITextField!
    
    //MARK:- TODO 5:
    ///Устраните retain-cycle, сделав ссылку на родителя слабой
    weak var parentVC: ListViewController?
    
    var employee: Employee!
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        lastNameField.becomeFirstResponder()
    }
    
    //MARK:- TODO 6: Передача данных обратно в список
    ///Когда пользователь решит закрыть экран, мы хотим сохранить внесенные изменения и передать данные обратно на родительский контроллер. Для этого нам нужно:
    ///1) Переопределить метод `viewDidDisappear` в этом контроллере (по аналогии с `viewDidLoad`)
    ///2) В этом методе сначала обновить модель (у нас для этого уже есть метод updateData)
    ///3) Затем обновить UI у родительского контроллера (с помощью `parentVC?.<...>`), поищите у него подходящий метод для этого :)
    ///
    ///❗️Заметьте, что передавать модель `Employee` обратно к родителю нам нет никакой необходимости, потому что `Employee` реализован как класс (ссылочный тип), следовательно, и этот контроллер, и родительский будут и так ссылаться на один и тот же экземпляр этого класса.

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func configure() {
        lastNameField.text = employee.lastName
        patronymicField.text = employee.patronymic
        firstNameField.text = employee.firstName
        positionField.text = employee.position
    }
    
    private func updateData() {
        employee.lastName = lastNameField.text ?? ""
        employee.patronymic = patronymicField.text ?? ""
        employee.firstName = firstNameField.text ?? ""
        employee.position = positionField.text ?? ""
    }

}

