//
//  CommentsViewCell.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 10/07/2021.
//

import UIKit

class CommentsViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    @IBOutlet weak var deletBtn: UIButton!
    
    var commmentsData: Comments? = nil{
        didSet{
            if let comments = commmentsData{
                DispatchQueue.main.async {
                    self.lblName.text = comments.name
                    self.lblEmail.text = comments.email
                    self.lblBody.text = comments.body
                    
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
