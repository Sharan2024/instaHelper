//
//  RequestStatusViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 22/01/24.
//

import UIKit

class RequestStatusViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var displayStatusWiseServantTable: UITableView!
    
    var status : String?
    let approvedRequests = requestedServant.filter { $0.status.lowercased() == "approved" }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        approvedRequests.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestStatusCell", for: indexPath) as! StatusWiseHelpersTableViewCell
        let ids = requestedServant.map { $0.id }
     let servant = ids[indexPath.row]
        
       cell.update(with: servant)
        cell.showsReorderControl = true

        return cell

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       displayStatusWiseServantTable.dataSource =  self
        displayStatusWiseServantTable.delegate = self
       print("Hi")
        

    }
}
