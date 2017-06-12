//
//  LiveTableViewCell.swift
//  YKLiveStream
//
//  Created by Ben on 17/6/12.
//  Copyright © 2017年 szd. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgV: UIImageView!
    @IBOutlet weak var nickLab: UILabel!
    @IBOutlet weak var locationLab: UILabel!
    @IBOutlet weak var lookNumLab: UILabel!
    @IBOutlet weak var bigImgV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
