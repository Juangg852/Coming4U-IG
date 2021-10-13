//
//  PostCell.swift
//  Coming4U-IG
//
//  Created by Juan Gonzalez on 10/12/21.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var PhotoView: UIImageView!
    
    @IBOutlet weak var UsernameLable: UILabel!
    
    @IBOutlet weak var CaptionLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
