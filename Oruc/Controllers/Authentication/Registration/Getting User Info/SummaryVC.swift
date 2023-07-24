//
//  SummaryVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class SummaryVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("DIFFICULTY IS \(String(describing: user?.programDifficulty))")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpButton()
    }
    
    func setUpButton(){
        startButton.layer.cornerRadius = 10
    }
    
    func go(){
        performSegue(withIdentifier: "registeredToApp", sender: self)
    }
    
    

    @IBAction func completePressed(_ sender: Any) {
        CoreDataManager.shared.save()
        go()
    }
}
