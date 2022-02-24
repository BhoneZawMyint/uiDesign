//
//  RoomTableViewCell.swift
//  uiDesign
//
//  Created by Macbook on 2/23/22.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var viewRateView: UIView!
    
    @IBOutlet weak var roomTypeLbl: UILabel!
    
    @IBOutlet weak var roomDetailsLbl: UILabel!
    
    @IBOutlet weak var roomPriceLbl: UILabel!
    
    @IBOutlet weak var roomImgView: UIImageView!
    var mdata: RoomVO? {
        didSet{
            roomTypeLbl.text = mdata?.roomType
            roomImgView.image = mdata?.roomImg
            roomDetailsLbl.text = mdata?.roomDetails
            roomPriceLbl.text = mdata?.roomPrice
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewRateView.layer.borderWidth = 2
        viewRateView.layer.borderColor = UIColor.green.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
