//
//  StageViewController.swift
//  Oruc
//
//  Created by Cenk Donmez on 8.07.2023.
//

import UIKit

class StageViewController: UIViewController {

    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var startStopText: UITextView!
    
    let stageVM = StageViewModel()
    
    var startDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewAccordingToProgress()
    }
    override func viewWillAppear(_ animated: Bool) {
        setViews()
    }
    
   func setViews(){
       infoText.clipsToBounds = true
       infoText.layer.cornerRadius = 30
    }
    
    func setViewAccordingToProgress(){
//        if progress >= 0.0 && progress < 7200.0{
//            titleText.text = stageVM.stages[0].stageTitle
//            infoText.text = stageVM.stages[0].stageInformation
//        }else if progress >= 7200.0 && progress < 18000.0{
//            titleText.text = stageVM.stages[1].stageTitle
//            infoText.text = stageVM.stages[1].stageInformation
//        }else if progress >= 18000.0 && progress < 28800.0{
//            titleText.text = stageVM.stages[2].stageTitle
//            infoText.text = stageVM.stages[2].stageInformation
//        }else if progress >= 28800.0 && progress < 36000.0{
//            titleText.text = stageVM.stages[3].stageTitle
//            infoText.text = stageVM.stages[3].stageInformation
//        }else if progress >= 36000.0 && progress < 43200.0{
//            titleText.text = stageVM.stages[4].stageTitle
//            infoText.text = stageVM.stages[4].stageInformation
//        }else if progress >= 43200.0 && progress < 64800.0{
//            titleText.text = stageVM.stages[5].stageTitle
//            infoText.text = stageVM.stages[5].stageInformation
//        }else{
//            titleText.text = stageVM.stages[6].stageTitle
//            infoText.text = stageVM.stages[6].stageInformation
//        }
            let progress = Date().timeIntervalSince(startDate!)
        
//        if progress >= 0.0 && progress < 7200.0{
//            titleText.text = stageVM.stages[0].stageTitle
//            infoText.text = stageVM.stages[0].stageInformation
//            startStopText.text = stageVM.stages[0].stageTime
//        }else if progress >= 7200.0 && progress < 18000.0{
//            titleText.text = stageVM.stages[1].stageTitle
//            infoText.text = stageVM.stages[1].stageInformation
//            startStopText.text = stageVM.stages[1].stageTime
//        }else if progress >= 18000.0 && progress < 28800.0{
//            titleText.text = stageVM.stages[2].stageTitle
//            infoText.text = stageVM.stages[2].stageInformation
//            startStopText.text = stageVM.stages[2].stageTime
//        }else if progress >= 28800.0 && progress < 36000.0{
//            titleText.text = stageVM.stages[3].stageTitle
//            infoText.text = stageVM.stages[3].stageInformation
//            startStopText.text = stageVM.stages[3].stageTime
//        }else if progress >= 36000.0 && progress < 43200.0{
//            titleText.text = stageVM.stages[4].stageTitle
//            infoText.text = stageVM.stages[4].stageInformation
//            startStopText.text = stageVM.stages[4].stageTime
//        }else if progress >= 43200.0 && progress < 64800.0{
//            titleText.text = stageVM.stages[5].stageTitle
//            infoText.text = stageVM.stages[5].stageInformation
//            startStopText.text = stageVM.stages[5].stageTime
//        }else{
//            titleText.text = stageVM.stages[6].stageTitle
//            infoText.text = stageVM.stages[6].stageInformation
//            startStopText.text = stageVM.stages[6].stageTime
//        }
        if progress >= 0.0 && progress < 3.0{
            titleText.text = stageVM.stages[0].stageTitle
            infoText.text = stageVM.stages[0].stageInformation
            startStopText.text = stageVM.stages[0].stageTime
        }else if progress >= 3.0 && progress < 6.0{
            titleText.text = stageVM.stages[1].stageTitle
            infoText.text = stageVM.stages[1].stageInformation
            startStopText.text = stageVM.stages[1].stageTime
        }else if progress >= 6.0 && progress < 9.0{
            titleText.text = stageVM.stages[2].stageTitle
            infoText.text = stageVM.stages[2].stageInformation
            startStopText.text = stageVM.stages[2].stageTime
        }else if progress >= 9.0 && progress < 12.0{
            titleText.text = stageVM.stages[3].stageTitle
            infoText.text = stageVM.stages[3].stageInformation
            startStopText.text = stageVM.stages[3].stageTime
        }else if progress >= 12.0 && progress < 15.0{
            titleText.text = stageVM.stages[4].stageTitle
            infoText.text = stageVM.stages[4].stageInformation
            startStopText.text = stageVM.stages[4].stageTime
        }else if progress >= 15.0 && progress < 18.0{
            titleText.text = stageVM.stages[5].stageTitle
            infoText.text = stageVM.stages[5].stageInformation
            startStopText.text = stageVM.stages[5].stageTime
        }else{
            titleText.text = stageVM.stages[6].stageTitle
            infoText.text = stageVM.stages[6].stageInformation
            startStopText.text = stageVM.stages[6].stageTime
        }

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "goToFastInfo"{
//            let destination = segue.destination as! StageViewController
//            
//            
//        }
    }
    

}
