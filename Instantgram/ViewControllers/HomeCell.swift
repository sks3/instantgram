//
//  HomeCell.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

  @IBOutlet var homeImage: UIImageView!
  
  @IBOutlet var homeCaption: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
