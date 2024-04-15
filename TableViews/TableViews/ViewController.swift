//
//  ViewController.swift
//  TableViews
//
//  Created by HTLILI on 13/04/2024.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var tableView: UITableView!
    
    var garcons: [Personne] =
    [Personne(name: "Max", image: nil, age: 19, gender:.homme),
     Personne(name: "Alain", image: nil, age: 27, gender:.homme),
     Personne(name: "Zak", image: nil, age: 21, gender:.homme),
     Personne(name: "Adam", image: nil, age: 18, gender:.homme),
     Personne(name: "Louis", image: nil, age: 30, gender:.homme)
    ]
    var filles = [Personne(name: "Stella", image: nil, age: 19, gender:.femme),
                  Personne(name: "Amber", image: nil, age: 27, gender:.femme),
                  Personne(name: "Tasnim", image: nil, age: 21, gender:.femme),
                  Personne(name: "Léa", image: nil, age: 18, gender:.femme),
                  Personne(name: "Lyla", image: nil, age: 30, gender:.femme)
                 ]
    
    var groups: [SectionTable] = []
    func getSection() {
        
      groups = [SectionTable(gender: "Male", array: garcons),
         SectionTable(gender: "Female", array: filles)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getSection()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return groups.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let indexSection = self.groups[section].array
        
        return indexSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personne = groups[indexPath.section].array[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell {
            cell.personne = personne
            return cell
        } else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.textColor = personne.color
            cell.textLabel?.text = personne.name
            cell.detailTextLabel?.text = groups[indexPath.section].gender
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let int = indexPath.row + 1
        let string = "\(int)"
        performSegue(withIdentifier: "details", sender: string)
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let headerLabel = UILabel(frame: newView.bounds)
        newView.addSubview(headerLabel)
        headerLabel.text = "Fin de la liste \(groups[section].gender)"
        newView.backgroundColor = .green
        return newView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return groups[section].gender
//    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Fin de la liste \(groups[section].gender)"
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" , let new = segue.destination as? DetailsController {
            new.string = sender as? String
        }
    }

}

