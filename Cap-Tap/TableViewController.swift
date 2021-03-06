//
//  TableViewController.swift
//  CapSeen
//
//  Created by Nilrajsinh Vaghela on 28/12/19.
//  Copyright © 2019 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TableViewController: UITableViewController,GADInterstitialDelegate {
    
    let cellSpacingHeight: CGFloat = 5
    
        var interstitial: GADInterstitial!


    
    
    
    var MainData = [
        ["Title":"Attitude","Controller":"Attitude"],
        ["Title":"Sassy","Controller":"Sassy"],
        ["Title":"Girl","Controller":"Girl"],
        ["Title":"Savage","Controller":"Savage"],
        ["Title":"Boy","Controller":"Boy"],
        ["Title":"Lit","Controller":"LIT"],
        ["Title":"Bio","Controller":"Bio"],
        ["Title":"Romantic","Controller":"Romantic"],
        ["Title":"Lyrics","Controller":"Lyric"],
        ["Title":"Dog","Controller":"dog"],
        ["Title":"Selfie","Controller":"Selfie"],
        ["Title":"Food","Controller":"Food"],
        ["Title":"Fitness","Controller":"Fitness"],
        ["Title":"Funny", "Controller":"Funny"],
        ["Title":"Inspirational", "Controller":"Inspirational"],
        ["Title":"Life", "Controller":"Life"],
        ["Title":"Success", "Controller":"Success"],
        ["Title":"Birthday", "Controller":"Birthday"],
        ["Title":"Season", "Controller":"Season"],
        ["Title":"Travel", "Controller":"Travel"],
        ["Title":"Heartbreak", "Controller":"Heartbreak"],
        ["Title":"Sad", "Controller":"Sad"],
        ["Title":"Beach", "Controller":"Beach"],
        ["Title":"Couple", "Controller":"Couple"],
        ["Title":"Friends", "Controller":"Friends"],
        ["Title":"#hashtag", "Controller":"Hashtag"]
  
    ]
    
    let backgroundImage = UIImage(#imageLiteral(resourceName: "bg"))
    
   
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8978960658795160/2397092070")
               let request = GADRequest()
               interstitial.load(request)
               interstitial = createAndLoadInterstitial()
                interstitial.delegate = self
        

        
        
        
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
               cell.layer.transform = rotationTransform
               cell.alpha = 0.5
               UIView.animate(withDuration: 1.2)
               {
                    cell.layer.transform = CATransform3DIdentity
                    cell.alpha = 1.0
               }
    }
    
    
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
           interstitial = createAndLoadInterstitial()
         }
    
    func createAndLoadInterstitial() -> GADInterstitial {
         var interstitial = GADInterstitial(adUnitID: "ca-app-pub-8978960658795160/2397092070")
         interstitial.delegate = self
         interstitial.load(GADRequest())
         return interstitial
       }
    
      
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MainData.count
        
    }

 

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor(white: 1, alpha: 0.2)
        cell.layer.cornerRadius = 32
        cell.layer.borderWidth = 3
        
        
        
        cell.textLabel?.text = MainData[indexPath.row]["Title"]
        
        // Configure the cell...
        
        

        return cell
    }
    
  

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if interstitial.isReady {
                        interstitial.present(fromRootViewController: self)
                      }
        
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: MainData[indexPath.row]["Controller"]!)
        self.navigationController?.pushViewController(controller!, animated: true)
        
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
    
    
    
    @IBAction func Info(_ sender: Any) {
        
         let alertView = UIAlertController(title: "Touch on any caption to copy", message: nil, preferredStyle: .alert)
         
         let okaction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
         
         alertView.addAction(okaction)
        
         
         self.present(alertView, animated: true)
        
    }
    
    
    

}
