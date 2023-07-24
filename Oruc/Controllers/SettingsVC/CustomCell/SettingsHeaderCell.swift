//
//  SettingsHeaderCell.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class SettingsHeaderCell: UITableViewCell {

    @IBOutlet weak var headerName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellComponents(name: String, iconName: String){
        headerName.text = name
        
    }
    

    
    

}
