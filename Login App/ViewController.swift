//
//  ViewController.swift
//  Login App
//
//  Created by Максим Фомичев on 04.06.2021.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    // MARK: - Private
    private enum Spec {
        static let minLoginLenght = 8
        static let minPasswordLenght = 8
        static let correctLoginTitle = "Success"
        static let correctLoginMessage = "User is authorized"
        static let incorrectLoginTitle = "Error"
        static let incorrectLoginMessage = "Login/Password is not found"
        static let alertOKButton = "OK"
    }
    
    private enum TestUser {
        static let login = "adminadmin"
        static let password = "12345678"
    }
    
    private var name: String {
        nameField.text ?? ""
    }
    
    private var password: String {
        passField.text ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadButtonIsEnabled()
    }
    
    @IBAction func nameField(_ sender: UITextField) {
        reloadButtonIsEnabled()
    }
    
    @IBAction func passField(_ sender: UITextField) {
        reloadButtonIsEnabled()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if name == TestUser.login, password == TestUser.password {
            showAlert(title: Spec.correctLoginTitle, message: Spec.correctLoginMessage, okButton: Spec.alertOKButton) {
                print("Success ok button action")
            }
        } else {
            showAlert(title: Spec.incorrectLoginTitle, message: Spec.incorrectLoginMessage, okButton: Spec.alertOKButton) {
                print("Failure ok button action")
            }
        }
    }
    
    private func reloadButtonIsEnabled() {
        loginButton.isEnabled = name.count >= Spec.minLoginLenght && password.count >= Spec.minPasswordLenght
    }
    
}
