//
//  MovieCell.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 24/06/2021.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var delete: UIButton!
    
    var movie:Movie? = nil{
        didSet{
            DispatchQueue.main.async {
                if let movisData = self.movie{
                    self.lblTitle.text = movisData.title
                    self.lblDescription.text = movisData.body
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
