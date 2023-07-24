//
//  SettingsVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit
import FirebaseAuth
class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let settings = [["Çıkış","Bize Ulaşın"],["Dünya Sağlık Örgütü"]]
    let icons = ["door.right.hand.open","person.crop.circle.fill","stethoscope.circle"]
    
    let headerNames = ["Profil", "Sağlık Hakkında"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    func setUpTableView(){
        // Delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingsCell
        
        cell.setUpCellComponents(name: settings[indexPath.section][indexPath.row], iconName: icons[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = settings[indexPath.section][indexPath.row]
        
        if selected == "Çıkış"{
            // TODO open a view are you sure!
            signOut()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsHeaderCell") as! SettingsHeaderCell
        
        cell.setUpCellComponents(name: headerNames[section], iconName: "square.fill")
        
        return cell
        
    }
    
    
    
    func signOut() {
        do {
          try Auth.auth().signOut()
            go()
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    func go(){
        performSegue(withIdentifier: "settingsToLanding", sender: self)
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
