//
//  ViewController.swift
//  Login App
//
//  Created by Максим Фомичев on 04.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    var name: String = ""
    var correct: String = "Password is true"
    var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func nameField(_ sender: UITextField) {
        name = sender.text ?? ""
    }
    
    
    @IBAction func passField(_ sender: UITextField) {
        password = sender.text ?? ""
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        if (password == "124") {
        print(name + " - Password TRUE :)")
        }
        else {
            print( name + " - Password false :(")
        }
    }
    }
