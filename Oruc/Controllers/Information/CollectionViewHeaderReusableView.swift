//
//  CollectionViewHeaderReusableView.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import UIKit

final class CollectionViewHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ title: String) {
        cellTitleLbl.text = title
    }
}
