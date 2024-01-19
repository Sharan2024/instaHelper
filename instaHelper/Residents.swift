//
//  Residents.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 15/01/24.
//

import Foundation
struct Resident {
    var houseOwner: String
    var flatNumber: String
    var towerNumber: String
    var membershipID: String
}

let residents = [
    Resident(houseOwner: "Anish Gupta", flatNumber: "101", towerNumber: "A", membershipID: "M12345"),
    Resident(houseOwner: "Vikas Goyal", flatNumber: "202", towerNumber: "B", membershipID: "M67890"),
    Resident(houseOwner: "Anita Singla", flatNumber: "203", towerNumber: "B", membershipID: "M67834"),
    Resident(houseOwner: "Shikha", flatNumber: "204", towerNumber: "D", membershipID: "M67964"),
    Resident(houseOwner: "Shanky Goyal", flatNumber: "205", towerNumber: "A", membershipID: "M64632"),
    Resident(houseOwner: "Manmeet Kaur", flatNumber: "207", towerNumber: "D", membershipID: "M61464"),
    Resident(houseOwner: "Anupinder Singh", flatNumber: "208", towerNumber: "C", membershipID: "M68965"),
    Resident(houseOwner: "Amanpreet Singh", flatNumber: "209", towerNumber: "C", membershipID: "M67789")
]
