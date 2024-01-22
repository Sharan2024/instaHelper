//
//  request.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import Foundation

struct requests {
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

let requestedServant = [requests(id: 1, experience: 12, type: .cook, name: "Shabham Javed", dateandTime: "January 20 , 2024  10:00", price: "Rs.500", address: "Home", status: "Approved", house: "Anish Gupta", image: "shabham.jpg") ,requests(id: 2, experience: 5, type: .cook, name: "Rajni Rani", dateandTime: "January 20 , 2024  10:00", price: "Rs.600", address: "Home", status: "Pending", house: "Vikas Goyal", image: "rajni.jpg") ]


struct confirmedBookings {
    var id : Int
    var type: ServantType
    var name: String
    var dateandTime : String
    var price : String
    var address : String
}

let bookedServant = [confirmedBookings(id: 1, type: .cook, name: "Shabham Javed", dateandTime: "January 20 , 2024  10:00", price: "Rs.500", address: "Home") ]

struct RecievedBookings {
    var id : Int
    var name: String
    var RequesterName : String
    var dateandTime : String
  
}

let receivedRequestBooking = [RecievedBookings(id: 1,name: "Shabham Javed", RequesterName: "Sharan Sandhu", dateandTime: "January 20 , 2024  10:00")]
