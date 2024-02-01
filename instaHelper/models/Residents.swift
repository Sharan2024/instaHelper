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
    mutating func updateRequestedBookingStatus(bookingID: Int, newRequestedStatus: String) {
           if let index = sentRequests.firstIndex(where: { $0.id == bookingID }) {
               sentRequests[index].status = newRequestedStatus
           }
       }
    var sentRequests : [RequestedBookings]
    var confirmed : [ConfirmedBookings]
}

struct RecievedBookings {
    var id : Int
    var name: String
    var RequesterName : String
    var dateandTime : String
    var cost : String
    var status : String
}
struct RequestedBookings{
    var id : Int
    var dateandTime : String
    var price : String
    var address : String
    var status : String
    var house : String
}
struct ConfirmedBookings {
    var id : Int
    var dateandTime : String
    var price : String
    var address : String
}

class AppResidentDataModel {
    private var residents: [Resident] = []    
    init() {
        residents.append( Resident(houseOwner: "Sharan Sandhu", flatNumber: "110", towerNumber: "C", membershipID: "M53136", receivedBooking: [RecievedBookings(id: 5,name: "Shabham Javed", RequesterName: "Anish Gupta", dateandTime: "January 31 , 2024  10:00", cost: "500", status: "Not responded")], sentRequests: [RequestedBookings(id: 5, dateandTime: "January 31,2024", price: "500", address: "Home", status: "Approved", house: "Anish Gupta")], confirmed: []))
        residents.append( Resident(houseOwner: "Anish Gupta", flatNumber: "101", towerNumber: "A", membershipID: "M12345", receivedBooking: [RecievedBookings(id: 5,name: "Shabham Javed", RequesterName: "Sharan Sandhu", dateandTime: "January 31 , 2024  10:00", cost: "500", status: "Not responded")], sentRequests: [], confirmed: []))
        residents.append(Resident(houseOwner: "Vikas Goyal", flatNumber: "202", towerNumber: "B", membershipID: "M67890", receivedBooking: [], sentRequests: [], confirmed: []))
        residents.append( Resident(houseOwner: "Anita Singla", flatNumber: "203", towerNumber: "B", membershipID: "M67834", receivedBooking: [], sentRequests: [], confirmed: []))
        residents.append(Resident(houseOwner: "Shikha", flatNumber: "204", towerNumber: "D", membershipID: "M67964", receivedBooking: [], sentRequests: [], confirmed: []))
        residents.append( Resident(houseOwner: "Shanky Goyal", flatNumber: "205", towerNumber: "A", membershipID: "M64632", receivedBooking: [], sentRequests: [], confirmed: []))
        residents.append( Resident(houseOwner: "Manmeet Kaur", flatNumber: "207", towerNumber: "D", membershipID: "M61464", receivedBooking: [], sentRequests: [], confirmed: []))
        residents.append(Resident(houseOwner: "Anupinder Singh", flatNumber: "208", towerNumber: "C", membershipID: "M68965", receivedBooking: [], sentRequests: [], confirmed: []))
        residents.append( Resident(houseOwner: "Amanpreet Singh", flatNumber: "209", towerNumber: "C", membershipID: "M67789", receivedBooking: [], sentRequests: [], confirmed: []))
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
    func addSentRequest(resident: Resident, sentRequest: RequestedBookings) {
        guard var chosenResident = residents.first(where: { $0.membershipID == resident.membershipID }) else {
            print("Resident not found.")
            return
        }
        chosenResident.sentRequests.append(sentRequest)
        
        if let index = residents.firstIndex(where: { $0.membershipID == chosenResident.membershipID }) {
            residents[index] = chosenResident
        }
    }
    func addConfirmedBooking(resident: Resident, confirmed : ConfirmedBookings) {
        guard var chosenResident = residents.first(where: { $0.membershipID == resident.membershipID }) else {
            print("Resident not found.")
            return
        }
        chosenResident.confirmed.append(confirmed)
        if let index = residents.firstIndex(where: { $0.membershipID == chosenResident.membershipID }) {
            residents[index] = chosenResident
        }
    }
    func updateBookingStatus(residentID: String, bookingID: Int, newStatus: String) {
            if let index = residents.firstIndex(where: { $0.membershipID == residentID }) {
                residents[index].updateBookingStatus(bookingID: bookingID, newStatus: newStatus)
            }
        }
    func updateRequestedBookingStatus(residentID: String, bookingID: Int, newRequestedStatus: String) {
            if let index = residents.firstIndex(where: { $0.membershipID == residentID }) {
                residents[index].updateRequestedBookingStatus(bookingID: bookingID, newRequestedStatus: newRequestedStatus)
            }
        }

    }
var residentDataModel = AppResidentDataModel()
