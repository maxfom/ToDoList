//
//  BaseViewController.swift
//  Login App
//
//  Created by Георгий Сабанов on 09.06.2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension UIViewController {
    
    func showAlert(
        title: String?,
        message: String?,
        okButton: String,
        okAction: @escaping () -> Void)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: okButton, style: .cancel) { _ in
            okAction()
        }
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }

}
