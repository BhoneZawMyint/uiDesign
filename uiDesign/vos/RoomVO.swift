//
//  RoomVO.swift
//  uiDesign
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import UIKit

class RoomVO {
    var roomType: String = ""
    var roomImg: UIImage?
    var roomDetails: String = ""
    var roomPrice: String = ""
    
    init(roomType:String, roomImg:UIImage,roomDetails:String,roomPrice:String) {
        self.roomType = roomType
        self.roomImg = roomImg
        self.roomDetails = roomDetails
        self.roomPrice = roomPrice
    }
}

extension RoomVO {
    static func getRoomList() -> [RoomVO] {
        return [.init(roomType: "Dulex Twin", roomImg: #imageLiteral(resourceName: "uiDesign7"),roomDetails:"Twin Single Beds, Free Wifi",roomPrice:"200.12"),
                .init(roomType: "Single", roomImg: #imageLiteral(resourceName: "uiDesign6"),roomDetails:"Single Bed,TV, Refigerator, Wifi",roomPrice:"115.04"),
                .init(roomType: "Double", roomImg: #imageLiteral(resourceName: "uiDesign5"),roomDetails:"Double Beds, TV, Wifi",roomPrice:"212.0"),
                .init(roomType: "Family Room", roomImg: #imageLiteral(resourceName: "uiDesign4"),roomDetails:"Single/Double/Extra Beds, TV",roomPrice:"152.22"),
                .init(roomType: "Hall", roomImg: #imageLiteral(resourceName: "uiDesign3"),roomDetails:"TV,Free Wifi",roomPrice:"135.12")
        ]
     }
}
