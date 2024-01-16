//
//  HelperTimeTable.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import Foundation

struct TimeSlot {
    var startTime: String
    var endTime: String
    var houseOwner: String
}

struct ServantSchedule {
    var servantName: String
    var timeSlots: [TimeSlot]
}

let servantA = ServantSchedule(servantName: "Servant A", timeSlots: [
    TimeSlot(startTime: "9:00 AM", endTime: "11:00 AM", houseOwner:"House 1"),
    TimeSlot(startTime: "11:00 AM", endTime: "12:30 PM", houseOwner: "NA"),
    TimeSlot(startTime: "12:30 PM", endTime: "2:30 PM", houseOwner: "House 2"),
    TimeSlot(startTime: "5:00 PM", endTime: "7:30 PM", houseOwner: "House 3"),
])

let servantB = ServantSchedule(servantName: "Servant B", timeSlots: [
    TimeSlot(startTime: "9:30 AM", endTime: "11:00 AM", houseOwner: "House 3"),
    TimeSlot(startTime: "11:00 AM", endTime: "12:30 PM", houseOwner: "House 4"),
    TimeSlot(startTime: "12:30 AM", endTime: "2:30 PM", houseOwner: "NA"),
    TimeSlot(startTime: "4:30 PM", endTime: "6:30 PM", houseOwner: "House 5"),
    TimeSlot(startTime: "6:30 PM", endTime: "7:30 PM", houseOwner: "House 6"),
])
