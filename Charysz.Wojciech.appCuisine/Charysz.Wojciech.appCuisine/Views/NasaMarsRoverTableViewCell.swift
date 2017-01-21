//
//  NasaMarsRoverTableViewCell.swift
//  Charysz.Wojciech.appCuisine
//
//  Created by Wojciech Charysz on 21.01.17.
//  Copyright © 2017 Wojciech Charysz. All rights reserved.
//

import UIKit

class NasaMarsRoverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var earthDateLabel: UILabel!
    @IBOutlet weak var cameraFullNameLabel: UILabel!
    @IBOutlet weak var cameraImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
