//
//  UserNameVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class UserNameVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    let user = User(context: CoreDataManager.shared.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    // MARK: - Alerts
    func showAlert(_ message: String, _ title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
             }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUpButton(){
        continueButton.layer.cornerRadius = 10
        continueButton.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        continueButton.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
        continueButton.isEnabled = false
    }
    
    func disableButton(){
        continueButton.isEnabled = false
        continueButton.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        continueButton.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
    }
    
    func enableButton(){
        continueButton.isEnabled = true
        continueButton.alpha = 1
        continueButton.tintColor = UIColor(named: "primary")
        continueButton.backgroundColor = UIColor(named: "secondary")
    }
    
    
    func setAllTextFields(){
        nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        nameTextField.delegate = self
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
        case nameTextField:
            nameTextField.becomeFirstResponder()
        default:
            fatalError()
        }
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if nameTextField.text.isNilOrEmpty{
            disableButton()
        }else {
            enableButton()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ageGender"{
            let destinationVC =  segue.destination as! UserAgeGenderVC
            if let userName = nameTextField.text{
                user.name = userName
            }
            destinationVC.user = user
        }
        
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        // Set Name to CoreData
        
    }

}
