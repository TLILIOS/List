//
//  CustomCell.swift
//  TableViews
//
//  Created by HTLILI on 15/04/2024.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var personneIV: UIImageView!
    
    var personne: Personne! {
        didSet {
            ageLabel.text = "\(personne.age) ans."
            nameLabel.text = personne.name
            personneIV.image = UIImage(systemName: personne.image ?? "personne.circle")
        }
    }
}
