//
//  ForgotViewController.swift
//  Login App
//
//  Created by Максим Фомичев on 17.06.2021.
//

import UIKit

class ForgotViewController: BaseViewController {
    
    // MARK: - Private
    private enum Spec {
        static let forgotError = "Please input email label"
        static let alertOKButton = "OK"
        static let errorTitle = "Error"
        static let successTitle = "Success"
        static let mailSentTo = "Your password will sent to "
        static let minEmailLenght = 5
    }
    
    @IBOutlet weak var forgotBackgroundImageView: UIImageView!
    @IBOutlet weak var forgotButton: StandardButton!
    @IBOutlet weak var forgotEmailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForgotButton()
        reloadForgotButton()
    }
    
    private var email: String {
        forgotEmailField.text ?? ""
    }
    
    @IBAction func emailDidChange(_ sender: UITextField) {
        reloadForgotButton()
    }
    
    private func reloadForgotButton() {
        forgotButton.isEnabled = email.count > Spec.minEmailLenght
    }
    
    @IBAction func forgotButtonAction() {
        if email.hasSuffix(".ru") {
            showAlert(
                title: Spec.successTitle,
                message: Spec.mailSentTo + email,
                okButton: Spec.alertOKButton,
                okAction: {
                }
            )
        }
        else {
            showAlert(
                title: Spec.errorTitle,
                message: Spec.forgotError,
                okButton: Spec.alertOKButton,
                okAction: {
                }
            )
        }
    }
    
    private func setupForgotButton() {
        forgotButton.setAlpha(1, for: .normal)
        forgotButton.setAlpha(0.8, for: .highlighted)
        forgotButton.setBackgroundColor(UIColor.white, for: .normal)
        forgotButton.setBackgroundColor(UIColor.systemGray, for: .highlighted)
    }
    
}
