//
//  InfoDetailViewController.swift
//  Oruc
//
//  Created by Cenk Donmez on 22.07.2023.
//

import UIKit

class InfoDetailViewController: UIViewController {
    
    @IBOutlet weak var infoImage: UIImageView!
    var desc: String?
    var infoTitle: String?
    var image: String?
    
    @IBOutlet weak var titleOutlet: UITextView!
    
    @IBOutlet weak var descriptionOutlet: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleOutlet.text = infoTitle
        descriptionOutlet.text = desc
        infoImage.image = UIImage(named: image ?? "")
        infoImage.layer.cornerRadius = 10
        infoImage.clipsToBounds = true
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
