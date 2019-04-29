//
//  ViewController.swift
//  MyTV
//
//  Created by Andre Heß on 28.04.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit
import WebKit

class TVViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tvWebView: WKWebView!
    @IBOutlet weak var channelUpButton: UIButton!
    @IBOutlet weak var channelDownButton: UIButton!
    @IBOutlet weak var channelListButton: UIButton!
    @IBOutlet weak var teletextButton: UIButton!
    
    var channelList = ChannelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let channel = channelList.currentChannel
        load(channel: channel)
    }
    
    public func load(channel: Channel) {
        let tvRequest = URLRequest(url: URL(string: channel.linkUrlString)!)
        tvWebView.load(tvRequest)
        headerLabel.text = channel.name
    }

    // button handling
    
    @IBAction func channelUpButtonTouched(_ sender: Any) {
        DLog("channelUpButtonTouched...")
        
        guard let channel = channelList.getNextChannel() else { return }
        load(channel: channel)
    }
    
    @IBAction func channelDownButtonTouched(_ sender: Any) {
        DLog("channelDownButtonTouched...")
        
        guard let channel = channelList.getPreviousChannel() else { return }
        load(channel: channel)
    }
    
    @IBAction func channelListButtonTouched(_ sender: Any) {
        DLog("channelListButtonTouched...")
    }
    
    @IBAction func teletextButtonTouched(_ sender: Any) {
        DLog("teletextButtonTouched...")
    }
    
    // WKUIDelegate and WKNavigationDelegate handling
    
}

