//
//  SettingsCell.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var settingName: UILabel!
    @IBOutlet weak var settingIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellComponents(name: String, iconName: String){
        settingName.text = name
        settingIcon.image = UIImage(systemName: iconName)
        arrowImage.image = UIImage(systemName: "arrow.right.square.fill")
    }

}
