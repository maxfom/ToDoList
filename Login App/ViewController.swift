//
//  ViewController.swift
//  Login App
//
//  Created by Максим Фомичев on 04.06.2021.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var loginButton: StandardButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var hidePassword: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    // MARK: - Private
    private enum Spec {
        static let minLoginLenght = 8
        static let minPasswordLenght = 8
        static let correctLoginTitle = "Success"
        static let correctLoginMessage = "User is authorized"
        static let incorrectLoginTitle = "Error"
        static let incorrectLoginMessage = "Login/Password is not found"
        static let alertOKButton = "OK"
        static let backgroundImage = Assets.Authorization.background
        static let openedEyeImage = Assets.Authorization.HidePasswordButton.openedEye
        static let closedEyeImage = Assets.Authorization.HidePasswordButton.closedEye
        static let isSecureTextEntryEnabledOnStart = false
        static let authSegueIdentificator = "Auth"
        static let forgotPasswordButtonTitle = "Forgot password?"
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
        setupLoginButton()
        setupBackgroundImage()
        setupForgotButton()
        reloadButtonIsEnabled()
        hidePasswordToogle(forcedValue: Spec.isSecureTextEntryEnabledOnStart)
    }
    
    @IBAction func nameField(_ sender: UITextField) {
        reloadButtonIsEnabled()
    }
    
    @IBAction func passField(_ sender: UITextField) {
        reloadButtonIsEnabled()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if name == TestUser.login, password == TestUser.password {
            showMainViewController()
        } else {
            showAlert(title: Spec.incorrectLoginTitle, message: Spec.incorrectLoginMessage, okButton: Spec.alertOKButton) {
                print("Failure ok button action")
            }
        }
    }
    
    @IBAction func hiddenPass(_ sender: Any) {
        hidePasswordToogle()
    }
    
    @IBAction func forgotPasswordClick(_ sender: Any) {
        
    }
    
    private func setupLoginButton() {
        loginButton.setAlpha(1, for: .normal)
        loginButton.setAlpha(0.8, for: .highlighted)
        loginButton.setBackgroundColor(UIColor.systemBlue, for: .normal)
        loginButton.setBackgroundColor(UIColor.darkGray, for: .disabled)
    }
    
    private func setupForgotButton() {
        forgotPassword.setTitle(Spec.forgotPasswordButtonTitle, for: .normal)
    }
    
    private func setupBackgroundImage() {
        backgroundImageView.image = Spec.backgroundImage
    }
    
    private func reloadButtonIsEnabled() {
        loginButton.isEnabled = name.count >= Spec.minLoginLenght && password.count >= Spec.minPasswordLenght
    }
    
    private func hidePasswordToogle(forcedValue: Bool? = nil) {
        passField.isSecureTextEntry = forcedValue ?? !passField.isSecureTextEntry
        updateHideImage()
    }
    
    
    private func updateHideImage() {
        hidePassword.setImage(
            passField.isSecureTextEntry ?
                Spec.openedEyeImage :
                Spec.closedEyeImage,
            for: .normal
        )
        hidePassword.setImage(
            passField.isSecureTextEntry ?
                Spec.closedEyeImage :
                Spec.openedEyeImage,
            for: .highlighted
        )
    }
    
    private func showMainViewController() {
        performSegue(withIdentifier: Spec.authSegueIdentificator, sender: self)
    }
}
