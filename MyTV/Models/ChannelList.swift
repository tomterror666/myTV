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
    
    public var numberOfChannels: Int {
        return channels.count
    }
    
    override init() {
        channels = []
        numberOfCurrentChannel = 0
        
        super.init()
        
        channels = generateChannelList()
    }
    
    private func generateChannelList() -> [Channel] {
        return [Channel(name: "ARD", url: "https://www.ardmediathek.de/tv/Das-Erste/live?kanal=208", teletext: "https://www.ard-text.de"),
                Channel(name: "ZDF", url: "https://www.zdf.de/sender/zdf/zdf-live-beitrag-100.html", teletext: "https://teletext.zdf.de/teletext/zdf/"),
                Channel(name: "RBB Berlin", url: "https://mediathek.rbb-online.de/tv/live?kanal=21518358", teletext: ""),
                Channel(name: "RBB Brandenburg", url: "https://mediathek.rbb-online.de/tv/live?kanal=21518356", teletext: ""),
                Channel(name: "MDR", url: "https://www.ardmediathek.de/tv/MDR-SACHSEN/live?kanal=1386804", teletext: ""),
                Channel(name: "WDR", url: "https://www1.wdr.de/mediathek/video/live/index.html", teletext: ""),
                Channel(name: "HR", url: "https://www.ardmediathek.de/tv/hr-fernsehen/live?kanal=5884", teletext: ""),
                Channel(name: "SR", url: "https://www.ardmediathek.de/tv/SR-Fernsehen/live?kanal=5870", teletext: ""),
                Channel(name: "SWR", url: "https://www.ardmediathek.de/tv/SWR-Baden-W%C3%BCrttemberg/live?kanal=5904", teletext: ""),
                Channel(name: "BR", url: "https://www.ardmediathek.de/tv/BR-Fernsehen-Nord/live?kanal=21537244", teletext: ""),
                Channel(name: "NDR", url: "https://www.ardmediathek.de/tv/NDR-Mecklenburg-Vorpommern/live?kanal=21518350", teletext: ""),
                Channel(name: "Phönix", url: "https://www.ardmediathek.de/tv/Phoenix/live?kanal=5888", teletext: ""),
                Channel(name: "Tagesshau24", url: "https://www.ardmediathek.de/tv/tagesschau24/live?kanal=5878", teletext: ""),
                Channel(name: "3Sat", url: "https://www.ardmediathek.de/tv/3sat/live?kanal=5900", teletext: ""),
                Channel(name: "ARTE", url: "https://www.ardmediathek.de/tv/ARTE-deutsch/live?kanal=5880", teletext: ""),
                Channel(name: "Alpha", url: "https://www.ardmediathek.de/tv/ARD-alpha/live?kanal=5868", teletext: ""),
                Channel(name: "ZDF Info", url: "https://www.zdf.de/dokumentation/zdfinfo-doku/zdfinfo-live-beitrag-100.html", teletext: ""),
                Channel(name: "ZDF Neo", url: "https://www.zdf.de/sender/zdfneo/zdfneo-live-beitrag-100.html", teletext: ""),
                Channel(name: "KIKA", url: "https://www.kika.de/videos/livestream/index.html", teletext: ""),
                Channel(name: "One", url: "https://www.ardmediathek.de/tv/ONE/live?kanal=673348", teletext: ""),
                Channel(name: "Sat1", url: "https://www.sat1.de/livestream", teletext: ""),
                Channel(name: "Pro7", url: "https://www.prosieben.de/livestream?v=455345747", teletext: ""),
                Channel(name: "Kabel1", url: "https://www.kabeleins.de/livestream?v=37805047", teletext: ""),
                Channel(name: "Tele5", url: "https://www.tele5.de/live", teletext: ""),
                Channel(name: "Pro7 Maxx", url: "https://www.prosiebenmaxx.de/livestream?v=2088646448", teletext: ""),
                Channel(name: "Welt", url: "https://www.welt.de/tv-programm-live-stream/", teletext: ""),
                Channel(name: "N-TV", url: "https://www.n-tv.de/mediathek/livestream/", teletext: ""),
                Channel(name: "Sport1", url: "https://tv.sport1.de/sport1/", teletext: ""),
                Channel(name: "Eurosport", url: "https://www.eurosport.de/watch-eurosport-live.shtml", teletext: ""),
                Channel(name: "Sixx", url: "https://www.sixx.de/livestream?v=1035010800", teletext: ""),
                Channel(name: "Disney Channel", url: "https://disneychannel.de/livestream", teletext: ""),
                Channel(name: "ServusTV", url: "https://www.servus.com/tv/jetzt-live/", teletext: "")]
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
    
    public func getChannel(atIndex index: Int) -> Channel? {
        guard index < channels.count,
            index >= 0 else { return nil }
        
        numberOfCurrentChannel = index
        return currentChannel
    }
    
    public func add(_ channel: Channel) {
        channels.append(channel)
    }
    
    public func delete(channelAt at: Int) {
        channels.remove(at: at)
    }
    
    public func moveChannel(from fromIndex: Int, to toIndex: Int) {
        let channelToMove = channels[fromIndex]
        
        channels.remove(at: fromIndex)
        channels.insert(channelToMove, at: toIndex)
    }
}
