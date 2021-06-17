//
//  ForgotViewController.swift
//  Login App
//
//  Created by Максим Фомичев on 17.06.2021.
//

import UIKit

class ForgotViewController: BaseViewController {
    
    static let forgotError = "Please input email label"
    static let alertOKButton = "OK"
    static let errorTitle = "Error"
    static let successTitle = "Success"
    static let mailSentTo = "Your password will sent to "
    static let minEmailLenght = 5
    
    @IBOutlet weak var forgotbackgroundImageView: UIImageView!
    @IBOutlet weak var forgotButton: StandardButton!
    @IBOutlet weak var forgotEmailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForgotButton()
        reloadButtonForgot()
        // Do any additional setup after loading the view.
    }
    
    private var email: String {
        forgotEmailLabel.text ?? ""
    }
    
    @IBAction func forgotEmailLabel(_ sender: UITextField) {
        reloadButtonForgot()
    }
    
    private func reloadButtonForgot() {
        forgotButton.isEnabled = email.count > ForgotViewController.minEmailLenght
    }
    
    @IBAction func forgotClick() {
        if email.count > 0 && email.hasSuffix(".ru") {
            showAlert(
                title: ForgotViewController.successTitle,
                message: ForgotViewController.mailSentTo + email,
                okButton: ForgotViewController.alertOKButton,
                okAction: {
                }
            )
        }
        else {
            showAlert(
                title: ForgotViewController.errorTitle,
                message: ForgotViewController.forgotError,
                okButton: ForgotViewController.alertOKButton,
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
