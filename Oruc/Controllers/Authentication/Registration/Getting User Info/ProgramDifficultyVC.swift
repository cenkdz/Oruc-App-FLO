//
//  ProgramDifficultyVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class ProgramDifficultyVC: UIViewController {
    
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var programInfo: UITextView!
    @IBOutlet weak var programSuggestionText: UITextView!
    @IBOutlet weak var programDifficultySelector: UISegmentedControl!
    
    var info: [(String,String)] = [("The 16:8 Intermittent Fasting schedule involves fasting for 16 hours and having an 8-hour eating window each day. This program is easy for most people. Friendly for beginners.","This program is easy for most people. Friendly for beginners."),("The 18:6 Intermittent Fasting schedule involves fasting for 18 hours and having an 6-hour eating window each day.","This program requires more effort. Suitable for people who tried fasting before."),("The 20:4 Intermittent Fasting schedule involves fasting for 20 hours and having an 4-hour eating window each day. This program requires the most effort.","We do not recommend this program for beginners since fasting at this level is challenging and quite harsh.")]
    
    var infoTurkish: [(String,String)] = [("16:8 Aralıklı Oruç programı, 16 saatlik oruç ve 8 saatlik bir yeme aralığına sahiptir.","Bu program çoğu insan için kolaydır. Yeni başlayanlar için ideal."),("18:6 Aralıklı Oruç programı, 18 saatlik oruç tutmayı ve her gün 6 saatlik bir yeme aralığına sahiptir.","Bu program daha fazla çaba gerektirir. Daha önce aralıklı orucu denemiş kişiler için uygundur."),("20:4 Aralıklı Oruç programı, 20 saatlik oruç tutmayı ve her gün 4 saatlik bir yeme aralığına sahiptir. Bu program en fazla çabayı gerektirir.","Bu seviyede oruç tutmak zordur. Bu programı yeni başlayanlara önermiyoruz.")]
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programDifficultySelector.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpButton()
    }
    
    func setUpButton(){
        continueButton.layer.cornerRadius = 10
    }
    
    @objc func segmentSelected(sender: UISegmentedControl){
        programInfo.text = infoTurkish[sender.selectedSegmentIndex].0
        programSuggestionText.text = infoTurkish[sender.selectedSegmentIndex].1
        
        switch programDifficultySelector.selectedSegmentIndex {
        case 0:
            programSuggestionText.textAlignment = .left
            programInfo.textAlignment = .left
        case 1:
            programSuggestionText.textAlignment = .center
            programInfo.textAlignment = .center
        case 2:
            programSuggestionText.textAlignment = .right
            programInfo.textAlignment = .right
        default:
            fatalError()
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        user?.programDifficulty = Int64(programDifficultySelector.selectedSegmentIndex)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "summary"{
            let destinationVC =  segue.destination as! SummaryVC
            destinationVC.user = user
        }
    }

}



