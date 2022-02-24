//
//  HotelVO.swift
//  uiDesign
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import UIKit

class HotelVO {
    var hotelName: String = ""
    var hotelImg: UIImage?
    
    init(hotelName:String, hotelImg:UIImage) {
        self.hotelName = hotelName
        self.hotelImg = hotelImg
    }
}

extension HotelVO {
    static func getHotelList() -> [HotelVO] {
        return [.init(hotelName: "Sedona Hotel", hotelImg: #imageLiteral(resourceName: "uiDesign1")),
                .init(hotelName: "Trader Hotel", hotelImg: #imageLiteral(resourceName: "uiDesign2")),
                .init(hotelName: "Novotel Hotel", hotelImg: #imageLiteral(resourceName: "uiDesign3")),
                .init(hotelName: "Chatrium Hotel", hotelImg: #imageLiteral(resourceName: "uiDesign4")),
                .init(hotelName: "Hotel G", hotelImg: #imageLiteral(resourceName: "uiDesign5")),
                .init(hotelName: "Hotel Paradise", hotelImg: #imageLiteral(resourceName: "uiDesign6")),
                .init(hotelName: "KantawGyi Hotel", hotelImg: #imageLiteral(resourceName: "uiDesign7"))
        ]
     }
}
