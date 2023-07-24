//
//  WeightUpdaterVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 20.07.2023.
//

import UIKit

class WeightUpdaterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var newWeight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }

    @IBAction func updatePressed(_ sender: Any) {
        let user = CoreDataManager.shared.getUserData().first
        user?.weight = NSDecimalNumber(string: newWeight.text)
        CoreDataManager.shared.save()
        performSegue(withIdentifier: "goToWeightVC", sender: self)
        FirebaseHelper.shared.addUserWeight(date: Date(), weight: NSDecimalNumber(string: newWeight.text) as Decimal)
        //self.dismiss(animated: false)
        
    }
    
    // MARK: - Alerts
    func showAlert(_ message: String, _ title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
             }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUpButton(){
        updateButton.layer.cornerRadius = 10
        updateButton.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        updateButton.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
        updateButton.isEnabled = false
    }
    
    func disableButton(){
        updateButton.isEnabled = false
        updateButton.backgroundColor = UIColor(red: 0.07, green: 0.36, blue: 0.81, alpha: 1.00)
        updateButton.tintColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.00)
    }
    
    func enableButton(){
        updateButton.isEnabled = true
        updateButton.alpha = 1
        updateButton.tintColor = UIColor(named: "primary")
        updateButton.backgroundColor = UIColor(named: "secondary")
    }
    
    
    func setAllTextFields(){
        newWeight.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        newWeight.delegate = self
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
        case newWeight:
            newWeight.becomeFirstResponder()
        default:
            fatalError()
        }
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if newWeight.text.isNilOrEmpty{
            disableButton()
        }else {
            enableButton()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
