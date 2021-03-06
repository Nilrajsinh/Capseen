//
//  Fav.swift
//  CapSeen
//
//  Created by Nilrajsinh Vaghela on 04/01/20.
//  Copyright © 2020 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import CoreData

class Fav: UITableViewController {
    
    let backgroundImage = UIImage(#imageLiteral(resourceName: "bg2"))
    
    
    var managedContextObject:NSManagedObjectContext!
         //model data: table's row
         var managedObject:NSManagedObject!
         //list
         var list:[NSManagedObject]!
 
    

    override func viewDidLoad() {
        
        let imageView = UIImageView(image: backgroundImage)
                          self.tableView.backgroundView = imageView
               
               
               
               let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                      let blurView = UIVisualEffectView(effect: blurEffect)
                      blurView.frame = imageView.bounds
                      imageView.addSubview(blurView)
                      super.viewDidLoad()
        
        
        super.viewDidLoad()
          super.viewWillAppear(true)

        let appDel = UIApplication.shared.delegate as! AppDelegate
              self.managedContextObject = appDel.persistentContainer.viewContext
                                   
                      listData()
    tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
                     
        listData()

           tableView.reloadData()
       }
    
    func listData(){
               
               
               let fetchReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Cap")
               
               do{
                   self.list = try self.managedContextObject.fetch(fetchReq) as! [NSManagedObject]
                   for item in self.list{
                      
                   }
               }
               catch{
                   print("Error in fetch")
               }
               
            tableView.reloadData()
               
           }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        
          cell.textLabel?.text = "\(self.list[indexPath.row].value(forKey: "like")!)"
        // Configure the cell...
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
