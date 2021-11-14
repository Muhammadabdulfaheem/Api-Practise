//
//  NetflixCell.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 30/06/2021.
//

import UIKit

class NetflixCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    
    var netflix: Netflix? = nil{
        didSet{
            if let netflixData = netflix{
                DispatchQueue.main.async {
                    self.movieImage.loadImage(netflixData.thumbnailURL)// image = UIImage(named: netflixData.thumbnailURL)
                    self.lblTitle.text = netflixData.title
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
