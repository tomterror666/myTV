//
//  ChannelCell.swift
//  MyTV
//
//  Created by Andre Heß on 29.04.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    @IBOutlet weak var channelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func update(withChannel channel: Channel) {
        channelNameLabel.text = channel.name
    }

    
}
