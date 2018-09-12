//
//  MainTableViewController.swift
//  TableViewExample
//
//  Created by Yoga Pratama on 06/09/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
 /*  var playerName =  ["Jordan Henderson" , "Mohammed Salah", "Sadio Mane" , "Roberto Firmino",
                       "Allison Becker" , "Naby Keita" , "Xherdan Shaqiri","Virgil Van Dijk",
                       "Trent Alexander Arnold" , "Joe Gomez" , "Dejan Lovren" , "Simon Mignolet",
                       "Andrew Robertson" , "Fabinho" , "James Milner" , "Daniel Sturridge","Alberto Moreno", "Joel Matip"
                      ] */
    
    var playerName =  ["Jordan Henderson" , "Mohammed Salah", "Sadio Mane" , "Roberto Firmino",
                      ]
    var playerImage = ["henderson","salah","mane","firmino"]
    var playerAge = ["28" , "26" , "26" , "27"]
    var playerPos = ["Midfielder" , "Winger", "Winger" , "Striker"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playerName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        // downcast to cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainTableViewCell

        // Configure the cell...
       // cell.textLabel?.text = playerName[indexPath.row]
       // cell.imageView?.image = UIImage(named: playerImage[indexPath.row])
          cell.playerName.text = playerName[indexPath.row]
          cell.playerImage.image = UIImage(named: playerImage[indexPath.row])
          cell.playerAge.text = playerAge[indexPath.row]
          cell.playerPos.text = playerPos[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }else{
            cell?.accessoryType = .checkmark
            
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
     override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //delete row
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action , sourceView , completionnHandler) in
            
            self.playerName.remove(at: indexPath.row)
            self.playerPos.remove(at: indexPath.row)
            self.playerAge.remove(at: indexPath.row)
            self.playerImage.remove(at: indexPath.row)
            completionnHandler(true)
            
        }
        
        //customize icon
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        
        
        //share image
        let shareAction = UIContextualAction(style: .normal, title: "Share"){
            (action, sourceView, completionHandler) in
            
            let Name =  "Player Name is :" + self.playerName[indexPath.row]
           // let activityController = UIActivityViewController(activityItems: [Name], applicationActivities: nil)
            
            let activityController : UIActivityViewController
            
            if let imageShare  = UIImage(named: self.playerImage[indexPath.row])
            {
                 activityController = UIActivityViewController(activityItems: [Name,imageShare], applicationActivities: nil)
            }else{
                 activityController = UIActivityViewController(activityItems: [Name], applicationActivities: nil)
            }
            
            self.present(activityController, animated:  true , completion:  nil)
            completionHandler(true)
        }
        
        // customize icon
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction , shareAction])
        return swipeConfig
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
  /*  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    } */
    
    


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
