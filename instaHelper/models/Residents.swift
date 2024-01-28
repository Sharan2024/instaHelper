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
    var receivedBooking : [RecievedBookings]
    mutating func updateBookingStatus(bookingID: Int, newStatus: String) {
           if let index = receivedBooking.firstIndex(where: { $0.id == bookingID }) {
               receivedBooking[index].status = newStatus
           }
       }
}
//
//var residents = [
//    Resident(houseOwner: "Anish Gupta", flatNumber: "101", towerNumber: "A", membershipID: "M12345", receivedBooking: [RecievedBookings(id: 1,name: "Shabham Javed", RequesterName: "Sharan Sandhu", dateandTime: "January 20 , 2024  10:00", status: "Not responded")]),
//    Resident(houseOwner: "Vikas Goyal", flatNumber: "202", towerNumber: "B", membershipID: "M67890", receivedBooking: []),
//    Resident(houseOwner: "Anita Singla", flatNumber: "203", towerNumber: "B", membershipID: "M67834", receivedBooking: []),
//    Resident(houseOwner: "Shikha", flatNumber: "204", towerNumber: "D", membershipID: "M67964", receivedBooking: []),
//    Resident(houseOwner: "Shanky Goyal", flatNumber: "205", towerNumber: "A", membershipID: "M64632", receivedBooking: []),
//    Resident(houseOwner: "Manmeet Kaur", flatNumber: "207", towerNumber: "D", membershipID: "M61464", receivedBooking: []),
//    Resident(houseOwner: "Anupinder Singh", flatNumber: "208", towerNumber: "C", membershipID: "M68965", receivedBooking: []),
//    Resident(houseOwner: "Amanpreet Singh", flatNumber: "209", towerNumber: "C", membershipID: "M67789", receivedBooking: [])
//]

struct RecievedBookings {
    var id : Int
    var name: String
    var RequesterName : String
    var dateandTime : String
    var cost : String
    var status : String
    
  
}

    //var receivedRequestBooking = [RecievedBookings(id: 1,name: "Shabham Javed", RequesterName: "Sharan Sandhu", dateandTime: "January 20 , 2024  10:00", status: "Not responded")]

class AppResidentDataModel {
    private var residents: [Resident] = []    
    init() {
        residents.append( Resident(houseOwner: "Sharan Sandhu", flatNumber: "110", towerNumber: "C", membershipID: "M53136", receivedBooking: [RecievedBookings(id: 1,name: "Shabham Javed", RequesterName: "Anish Gupta", dateandTime: "January 28 , 2024  9:00", cost: "500", status: "Not responded")]))
        
        residents.append( Resident(houseOwner: "Anish Gupta", flatNumber: "101", towerNumber: "A", membershipID: "M12345", receivedBooking: [RecievedBookings(id: 1,name: "Shabham Javed", RequesterName: "Sharan Sandhu", dateandTime: "January 20 , 2024  10:00", cost: "500", status: "Not responded")]))
        residents.append(Resident(houseOwner: "Vikas Goyal", flatNumber: "202", towerNumber: "B", membershipID: "M67890", receivedBooking: []))
        residents.append( Resident(houseOwner: "Anita Singla", flatNumber: "203", towerNumber: "B", membershipID: "M67834", receivedBooking: []))
        residents.append(Resident(houseOwner: "Shikha", flatNumber: "204", towerNumber: "D", membershipID: "M67964", receivedBooking: []))
        residents.append( Resident(houseOwner: "Shanky Goyal", flatNumber: "205", towerNumber: "A", membershipID: "M64632", receivedBooking: []))
        residents.append( Resident(houseOwner: "Manmeet Kaur", flatNumber: "207", towerNumber: "D", membershipID: "M61464", receivedBooking: []))
        residents.append(Resident(houseOwner: "Anupinder Singh", flatNumber: "208", towerNumber: "C", membershipID: "M68965", receivedBooking: []))
        residents.append( Resident(houseOwner: "Amanpreet Singh", flatNumber: "209", towerNumber: "C", membershipID: "M67789", receivedBooking: []))
        
    }
    func getAllResidents() -> [Resident] { return self.residents }    
    func addResident(resident: Resident) { self.residents.append(resident)}
    func addBooking(resident : Resident , receivedBooking : RecievedBookings) {
//        var chosenResident = residents.filter({$0.houseOwner == resident.houseOwner})[0]
//        chosenResident.receivedBooking.append(receivedBooking)
        guard var chosenResident = residents.first(where: { $0.membershipID == resident.membershipID }) else {
                print("Resident not found.")
                return
            }
            
            chosenResident.receivedBooking.append(receivedBooking)
            
            if let index = residents.firstIndex(where: { $0.membershipID == chosenResident.membershipID }) {
                residents[index] = chosenResident
            }
    }
    func updateBookingStatus(residentID: String, bookingID: Int, newStatus: String) {
            if let index = residents.firstIndex(where: { $0.membershipID == residentID }) {
                residents[index].updateBookingStatus(bookingID: bookingID, newStatus: newStatus)
            }
        }
}
var residentDataModel = AppResidentDataModel()
