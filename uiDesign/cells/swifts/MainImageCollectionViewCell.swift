//
//  MainImageCollectionViewCell.swift
//  uiDesign
//
//  Created by Macbook on 2/23/22.
//

import UIKit

class MainImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var mdata: HotelVO? {
        didSet{
            imageView.image = mdata?.hotelImg
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
