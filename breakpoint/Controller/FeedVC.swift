//
//  FirstViewController.swift
//  breakpoint
//
//  Created by Koki Tabayashi on 2018/05/11.
//  Copyright © 2018年 Koki Tabayashi. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }
    
    // test
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
//            DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
//                self.messageArray = returnedMessagesArray.reversed()
//                self.tableView.reloadData()
//            }
//        }
//    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
//        cell.configureCell(profileImage: image!, email: message.senderId, content: message.content)
        return cell
    }
}
