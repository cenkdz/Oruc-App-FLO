//
//  LoginVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit
import FirebaseAuth
class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        setUpViews()
    }
    
    // MARK: - Alerts
    func showAlert(_ message: String, _ title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
             }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUpButton(){
        loginButtonOutlet.layer.cornerRadius = 10
        loginButtonOutlet.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        loginButtonOutlet.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
        loginButtonOutlet.isEnabled = false
    }
    
    func disableButton(){
        loginButtonOutlet.isEnabled = false
        loginButtonOutlet.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        loginButtonOutlet.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
    }
    
    func enableButton(){
        loginButtonOutlet.isEnabled = true
        loginButtonOutlet.alpha = 1
        loginButtonOutlet.tintColor = UIColor(named: "primary")
        loginButtonOutlet.backgroundColor = UIColor(named: "secondary")
    }
    
    
    func setAllTextFields(){
        emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func dismissKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    func setUpViews(){
        setAllTextFields()
        setUpButton()
        dismissKeyboard()
    }
    
    // MARK: - UITextField Delegate Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if emailTextField.text.isNilOrEmpty || passwordTextField.text.isNilOrEmpty {
            disableButton()
        }else {
            enableButton()
        }
    }
    
    func go(){
        performSegue(withIdentifier: "enterApp", sender: self)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error == nil{
                strongSelf.go()
            }else{
                strongSelf.showAlert("Username or password is wrong", "Error")
            }
        }
    }
}
