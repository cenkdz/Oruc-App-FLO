//
//  RegisterVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    // let handle = AuthStateDidChangeListenerHandle.self
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var registerButtonOutlet: UIButton!
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //handle = Auth.auth().addStateDidChangeListener { auth, user in
        // ...
        //}
        setUpViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    // MARK: - Password Validations
    func passwordsMatch(_ pass1: String, _ pass2: String) -> Bool{
        pass1 == pass2 ? true : false
    }
    
    func checkPasswordsMatch() -> Bool{
        if !passwordsMatch(passwordTextField.text ?? "", rePasswordTextField.text ?? ""){
            showAlert("Password do not match.", "Warning")
            return false
        }
        return true
    }
    
    // MARK: - Email Validation
    func validateEmail() -> Bool{
        if !(emailTextField.text ?? "").isValidEmail{
            showAlert("Please enter a valid email.", "Warning")
            return false
        }
        return true
    }
    
    // MARK: - Check Empty
    @objc func textFieldDidChange(_ textField: UITextField) {
        if emailTextField.text.isNilOrEmpty || passwordTextField.text.isNilOrEmpty || rePasswordTextField.text.isNilOrEmpty {
            disableButton()
        }else {
            enableButton()
        }
    }
    
    // MARK: - Alerts
    func showAlert(_ message: String, _ title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UI Prep
    func setUpButton(){
        registerButtonOutlet.layer.cornerRadius = 10
        registerButtonOutlet.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        registerButtonOutlet.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
        registerButtonOutlet.isEnabled = false
    }
    
    func disableButton(){
        registerButtonOutlet.isEnabled = false
        registerButtonOutlet.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        registerButtonOutlet.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
    }
    
    func enableButton(){
        registerButtonOutlet.isEnabled = true
        registerButtonOutlet.alpha = 1
        registerButtonOutlet.tintColor = UIColor(named: "primary")
        registerButtonOutlet.backgroundColor = UIColor(named: "secondary")
    }
    
    func setAllTextFields(){
        emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        rePasswordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField .delegate = self
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
        case passwordTextField:
            rePasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
    
    func go(){
        performSegue(withIdentifier: "goToSkipScreenVC", sender: self)
    }
    
    // MARK: - Button Pressed Actions
    @IBAction func registerPressed(_ sender: Any) {
        
        if self.checkPasswordsMatch() && self.validateEmail(){
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                if error == nil {
                    self.go()
                }else{
                    self.showAlert(error.map({ Error in
                        Error.localizedDescription
                    })!, "Error")
                }
            }
        }
    }

}

// MARK: - Extensions
extension String?{
    var isNilOrEmpty: Bool {return self == nil || self == ""}
}

extension String {
    var isValidEmail: Bool {NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)}
}









