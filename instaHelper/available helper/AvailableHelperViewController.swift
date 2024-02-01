//
//  AvailableHelperViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 16/01/24.
//

import UIKit

class AvailableHelperViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , DetailsDelegate {
    var finalId : Int = 0
    var date : String = ""
    var cost : String = ""
    var address : String = ""
    func didSelectCell(with data: Int) {
        finalId = data
    }
  
    @IBOutlet weak var noAvailableHelperLabel: UILabel!
    
    var avaiableServant : [Servant] = []
    var servant : [Int] = []
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? TimeSlotsViewController {
            print(finalId)
            destinationViewController.servantID = finalId
            destinationViewController.date = date
            destinationViewController.cost = cost
            destinationViewController.location = address
        }
    }
    @IBOutlet weak var displayHelperTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return servant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helperCell", for: indexPath) as! AvailableHelperTableViewCell
        
        let servant = servant[indexPath.row]
        
        cell.update(with: servant)
        cell.showsReorderControl = true
        cell.delegate = self
      //  cell.accessoryType = .detailDisclosureButton

        return cell

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        displayHelperTable.dataSource =  self
        displayHelperTable.delegate = self
        
        
        
    }
    func updateUI() {
        if !avaiableServant.isEmpty {
            noAvailableHelperLabel.isHidden = true
            for helper in avaiableServant {
                
              //  print("Servant ID: \(helper.id), Name: \(helper.name)")
                servant.append(helper.id)
                
            }
        }
        else {
            noAvailableHelperLabel.isHidden = false
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
