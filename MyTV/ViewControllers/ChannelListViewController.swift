//
//  ChannelListViewController.swift
//  MyTV
//
//  Created by Andre Heß on 29.04.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit

class ChannelListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let ChannelCellIdentifier = "ChannelCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    private var list: ChannelList
    
    required init?(coder aDecoder: NSCoder) {
        list = ChannelList()
        
        super.init(coder: aDecoder)
    }
    
    init(withChannelList channelList: ChannelList) {
        list = channelList
        
        super.init(nibName: "ChannelListViewController", bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "ChannelCell", bundle: nil), forCellReuseIdentifier: ChannelCellIdentifier)
    }


    // UITableViewDelegate and UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.numberOfChannels
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChannelCellIdentifier, for: indexPath) as? ChannelCell,
            let channel = list.getChannel(atIndex: indexPath.row) else {
                return UITableViewCell()
        }
        
        cell.update(withChannel: channel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return indexPath.row < list.numberOfChannels ? .delete : .insert
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.delete(channelAt: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        list.moveChannel(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    // Button handling
    
    @IBAction func sendButtonTouched(_ sender: Any) {
        
        tableView.isEditing = !tableView.isEditing
        
        editButton.title = tableView.isEditing ? "Done" : "Edit"
        
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
