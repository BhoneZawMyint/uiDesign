//
//  RateVO.swift
//  uiDesign
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import UIKit

class RateVO {
    var rateName: String = ""
    var rateInclusive: String = ""
    var rateRoomService: String = ""
    var rateDetails: String = ""
    var ratePrice: String = ""
    
    init(rateName:String,rateInclusive:String,rateRoomService:String,rateDetails:String,ratePrice:String) {
        self.rateName = rateName
        self.rateInclusive = rateInclusive
        self.rateRoomService = rateRoomService
        self.rateDetails = rateDetails
        self.ratePrice = ratePrice
    }
}

extension RoomVO {
    static func getRoomList() -> [RateVO] {
        return [
                .init(rateName: "Mobile App Special Voucher", rateInclusive: "Inclusive of Breakfast", rateRoomService: "20% off In-Room-Service", rateDetails: "Subject to GST and Servie Charge", ratePrice: "161.42"),
                .init(rateName: "Weekend Staycaption", rateInclusive: "Inclusive of All Day", rateRoomService: "10% off In-Room-Service", rateDetails: "Subject to GST and Servie Charge", ratePrice: "200.11"),
                .init(rateName: "Weekday Service", rateInclusive: "Breakfast and Lunch", rateRoomService: "30% off In-Room-Service", rateDetails: "Subject to GST and Servie Charge", ratePrice: "150.42"),
                .init(rateName: "Birthday Ceremony", rateInclusive: "One Lunch Time", rateRoomService: "25% off In-Room-Service", rateDetails: "Subject to GST and Servie Charge", ratePrice: "180.42"),
                .init(rateName: "Wedding Ceremony", rateInclusive: "Dinner for members", rateRoomService: "30% off In-Room-Service", rateDetails: "Subject to GST and Servie Charge", ratePrice: "200.42")
        ]
     }
}
