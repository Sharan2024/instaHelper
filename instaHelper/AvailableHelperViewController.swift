//
//  AvailableHelperViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 16/01/24.
//

import UIKit

class AvailableHelperViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var avaiableServant : [Servant] = []
    var servant : [Int] = []

    @IBOutlet weak var displayHelperTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        servant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helperCell", for: indexPath) as! AvailableHelperTableViewCell
        
        let servant = servant[indexPath.row]
        
        cell.update(with: servant)
        cell.showsReorderControl = true

        // Configure the cell...

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
           // print("Available servants:")
            for helper in avaiableServant {
                
              //  print("Servant ID: \(helper.id), Name: \(helper.name)")
                servant.append(helper.id)
                
            }
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
