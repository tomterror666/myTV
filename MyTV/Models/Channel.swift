//
//  Channel.swift
//  MyTV
//
//  Created by Andre Heß on 28.04.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit

class Channel: NSObject {

    public var name: String
    public var linkUrlString: String
    public var teletextUrlString: String
    
    init(name channelName: String, url urlString: String, teletext teletextUrl: String) {
        name = channelName
        linkUrlString = urlString
        teletextUrlString = teletextUrl
        
        super.init()
    }
    
    override init() {
        name = ""
        linkUrlString = ""
        teletextUrlString = ""
        
        super.init()
    }
}
