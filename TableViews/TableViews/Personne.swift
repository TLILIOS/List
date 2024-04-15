//
//  Personne.swift
//  TableViews
//
//  Created by HTLILI on 15/04/2024.
//

import UIKit

struct Personne {
    var name: String
    var image: String?
    var age: Int
    var gender: Gender
    
    var color: UIColor {
        return gender == .homme ? .magenta : .purple
    }
}
enum Gender {
    case homme, femme
}

struct SectionTable {
var gender: String
var array: [Personne]
    
}
