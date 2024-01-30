//
//  request.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import Foundation

struct BookingRequested {
    var id : Int
    var experience : Int
    var type: ServantType
    var name: String
    var dateandTime : String
    var price : String
    var address : String
    var status : String
    var house : String
    var image: String
}

let requestedServant = [BookingRequested(id: 1, experience: 5, type: .cook, name: "Shabham Javed", dateandTime: "January 20 , 2024  10:00", price: "Rs.500", address: "Home", status: "Approved", house: "Anish Gupta", image: "rajni1.jpg") ,BookingRequested(id: 2, experience: 5, type: .cook, name: "Rajni Rani", dateandTime: "January 20 , 2024  10:00", price: "Rs.600", address: "Home", status: "Pending", house: "Vikas Goyal", image: "rajni.jpg") ]
class RequestsDataModel {
    private var requests: [BookingRequested] = []
    init() {
        requests.append(
            BookingRequested(id: 5, experience: 12, type: .cook, name: "Shabham Javed", dateandTime: "January 20, 2024 10:00", price: "Rs.500", address: "Home", status: "Approved", house: "Anish Gupta", image: "rajni1.jpg"))
        
        requests.append(BookingRequested(id: 1, experience: 5, type: .cook, name: "Rajni Rani", dateandTime: "January 20, 2024 10:00", price: "Rs.600", address: "Home", status: "Pending", house: "Vikas Goyal", image: "rajni.jpg"))
    }
    
    func getAllRequests() -> [BookingRequested] {
        return self.requests
    }
    
    func addRequest(request: BookingRequested) {
        self.requests.append(request)
    }
}

var requestsDataModel = RequestsDataModel()

struct confirmedBookings {
    var id : Int
    var type: ServantType
    var name: String
    var dateandTime : String
    var price : String
    var address : String
}
class ConfirmedBookingsDataModel {
    private var confirmBookings: [confirmedBookings] = []
    
    init() {
        confirmBookings.append(
            confirmedBookings(id: 1, type: .cook, name: "Shabham Javed", dateandTime: "January 20, 2024 10:00", price: "Rs.500", address: "Home"))
    }
    func getAllConfirmedBookings() -> [confirmedBookings] {
        return self.confirmBookings
    }
    
    func addConfirmedBooking(booking: confirmedBookings) {
        self.confirmBookings.append(booking)
    }
}
var confirmedBookingsDataModel = ConfirmedBookingsDataModel()
