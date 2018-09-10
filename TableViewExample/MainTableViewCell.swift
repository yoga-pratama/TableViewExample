//
//  MainTableViewCell.swift
//  TableViewExample
//
//  Created by Yoga Pratama on 06/09/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var playerName : UILabel!
    @IBOutlet var playerAge : UILabel!
    @IBOutlet var playerPos : UILabel!
    @IBOutlet var playerImage : UIImageView!{
        didSet {
             playerImage.layer.cornerRadius = playerImage.bounds.width / 2
             playerImage.clipsToBounds = true
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
