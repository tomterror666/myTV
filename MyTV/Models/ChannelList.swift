//
//  ChannelList.swift
//  MyTV
//
//  Created by Andre Heß on 28.04.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit

class ChannelList: NSObject {
    
    private var channels: [Channel]
    private var numberOfCurrentChannel: Int
    
    public var currentChannel: Channel {
        get {
            return channels[numberOfCurrentChannel]
        }
        set {}
    }
    
    override init() {
        channels = []
        numberOfCurrentChannel = 0
        
        super.init()
        
        channels = generateChannelList()
    }
    
    private func generateChannelList() -> [Channel] {
        return [Channel(name: "ARD", url: "https://www.ardmediathek.de/tv/Das-Erste/live?kanal=208", teletext: "https://www.ard-text.de"),
                Channel(name: "ZDF", url: "https://www.zdf.de/sender/zdf/zdf-live-beitrag-100.html", teletext: "https://teletext.zdf.de/teletext/zdf/")]
    }
    
    public func getNextChannel() -> Channel? {
        guard numberOfCurrentChannel < channels.count else { return nil }
        
        numberOfCurrentChannel += 1
        return currentChannel
    }
    
    public func getPreviousChannel() -> Channel? {
        guard numberOfCurrentChannel > 0 else { return nil }
        
        numberOfCurrentChannel -= 1
        return currentChannel
    }
}
