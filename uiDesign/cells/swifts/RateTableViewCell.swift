//
//  RateTableViewCell.swift
//  uiDesign
//
//  Created by Macbook on 2/23/22.
//

import UIKit

class RateTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewRateView: UIView!
    @IBOutlet weak var rateNameLbl: UILabel!
    @IBOutlet weak var rateInclusiveLbl: UILabel!
    @IBOutlet weak var rateRoomServiceLbl: UILabel!
    @IBOutlet weak var rateDetailsLbl: UILabel!
    @IBOutlet weak var ratePriceLbl: UILabel!
    
    var mdata: RateVO? {
        didSet{
            rateNameLbl.text = mdata?.rateName
            rateInclusiveLbl.text = mdata?.rateInclusive
            rateRoomServiceLbl.text = mdata?.rateRoomService
            rateDetailsLbl.text = mdata?.rateDetails
            ratePriceLbl.text = mdata?.ratePrice
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewRateView.layer.borderWidth = 2
        viewRateView.layer.borderColor = UIColor.green.cgColor
        mainView.addDashBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

