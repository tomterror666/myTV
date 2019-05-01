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
    let AddChannelCellIdentifier = "AddChannelCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    private var list: ChannelList
    private var inEditMode = false
    
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
        return tableView.isEditing ? list.numberOfChannels + 1 : list.numberOfChannels
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChannelCellIdentifier, for: indexPath) as? ChannelCell,
            let channel = list.getChannel(atIndex: indexPath.row) else {
                let addCell = UITableViewCell(style: .default, reuseIdentifier: AddChannelCellIdentifier)
                addCell.textLabel?.text = "Add channel"
                return addCell
        }
        
        cell.update(withChannel: channel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return indexPath.row < list.numberOfChannels ? .delete : .insert
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TVAlert.showAlert(title: "Delete channel?",
                              message: nil,
                              onVC: self,
                              onDismiss: { (index: Int) in
                                self.list.delete(channelAt: indexPath.row)
                                self.tableView.deleteRows(at: [indexPath], with: .fade)
            },
                              onCancel: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return !tableView.isEditing || indexPath.row < list.numberOfChannels
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        list.moveChannel(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing && indexPath.row == list.numberOfChannels {
            openAddChannelForm()
        }
    }
    
    // Button handling
    
    @IBAction func sendButtonTouched(_ sender: Any) {

        let lastChannelPath = IndexPath(row: list.numberOfChannels - 1, section: 0)
        
        tableView.isEditing = !tableView.isEditing
        tableView.scrollToRow(at: lastChannelPath,
                              at: .middle,
                              animated: false)
        tableView.reloadSections(IndexSet(arrayLiteral: 0), with: .fade)
        tableView.scrollToRow(at: lastChannelPath,
                              at: .middle,
                              animated: true)
        
        editButton.title = tableView.isEditing ? "Done" : "Edit"
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Navigation handling
    
    private func openAddChannelForm() {
        let controller = AddChannelViewController(nibName: "AddChannelViewController", bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
