//
//  DetailsController.swift
//  TableViews
//
//  Created by HTLILI on 13/04/2024.
//

import UIKit

class DetailsController: UIViewController {

    var string: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let newString = string {
            titleLabel.text = "String reçue: \(newString)"
        }
        
        
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
