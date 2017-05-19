//
//  PlayerTableViewController.swift
//  TextFileCSV
//
//  Created by Cheidu on 4/4/17.
//  Copyright © 2017 Cheidu. All rights reserved.
//  The purpose of this file is to read the csv file, seperating the names of the players and their data

import UIKit

class PlayerTableViewController: UITableViewController {
    var player = [Player]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Estblishes a path to the correct csv file.
        // got from http://stackoverflow.com/questions/31778700/read-a-text-file-line-by-line-in-swift
        if let path = Bundle.main.path(forResource: "csvtest", ofType: "csv") {
            do {
                //These lines read the csv file and prints it out, seperating the array every new line
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                for nextplayer in myStrings {
                    var newPlayer = nextplayer.components(separatedBy: ",")
                    print(newPlayer)
                    let playerName = newPlayer[0]
                    // creates a new array that holds all the data
                    var floatsA = [Double]()
                    // adds the data to the array as long as it holds more than one piece of data, to avoid blanks
                    if newPlayer.count > 1{
                        for numbers in newPlayer[1...newPlayer.count - 1] {
                            floatsA.append(Double(Float(numbers)!))
                        }
                    }
                    let myPlayer = Player(name: playerName, data: floatsA)
                    player.append(myPlayer)
                }
            } catch {
                print(error)
            }
        }
        
        
        /*
         Need to first seperate the items in the array.
         seperate created string with comma
         create new instance of player
         player.name will equal the first string
         player.data will equal everything else
         add the new player to the player array
         */
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // returns the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns the required number of rows
        return player.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "playerName", for: indexPath)
        // got from https://www.ralfebert.de/tutorials/ios-swift-uitableviewcontroller/
        cell.textLabel?.text = player[indexPath.row].name
     
     // Configure the cell...
     
     return cell
     }
 
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    // http://stackoverflow.com/questions/39998358/ios-swift-passing-data-from-tableview-to-view-controller
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGraph" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! BarChartViewController
                let value = player[indexPath.row]
                controller.currentPlayer = value
            }
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
 
    
}
}
