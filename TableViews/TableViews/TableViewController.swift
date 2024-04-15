//
//  TableViewController.swift
//  TableViews
//
//  Created by HTLILI on 13/04/2024.
//

import UIKit

class TableViewController: UITableViewController {

    var toDoList: [String] = []
    
    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        toDoList = getDatas()
        tableView.reloadData()
    }
    
    func getDatas() -> [String] {
        return ["Vaisselle", "Aspirateur", "Drive", "Devoirs des enfants", "Tondre la pelouse", "Vétérinaire"]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //print(indexPath)
        let toDo = toDoList[indexPath.row]
        //print(toDo)
        cell.textLabel?.text = toDo
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

   
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        print(toDoList)
        let iteamSelected = toDoList[fromIndexPath.row]
        print("From: \(fromIndexPath)")
        toDoList.remove(at: fromIndexPath.row)
        print("To: \(to)")
        toDoList.insert(iteamSelected, at: to.row)
        print(toDoList)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func refreshPressed(_ sender: UIBarButtonItem) {
        toDoList = getDatas()
        tableView.reloadData()
    }
    

}
