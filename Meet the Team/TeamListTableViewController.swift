//
//  TeamListTableViewController.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import UIKit

class TeamListTableViewController: UITableViewController {
    
    var dataSource = [TeamMember]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UITableView properties
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.register(TeamListTableViewCell.self, forCellReuseIdentifier: "teamMemberCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchTeamMembersData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    func fetchTeamMembersData() {
        NetworkManager.fetchTeamMembers { (arrayOfTeamMembers, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    self.handleNetworkManagerErrors(networkManagerError: error!)
                    return
                }
                self.dataSource = arrayOfTeamMembers
            } 
        }
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamMemberCell", for: indexPath) as! TeamListTableViewCell

        // Configure the cell...

        return cell
    }

}
