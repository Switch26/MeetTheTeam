//
//  TeamListTableViewController.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import UIKit

class TeamListTableViewController: UITableViewController {
    
    private var dataSource = [TeamMember]() {
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
        tableView.allowsMultipleSelection = false
        
        self.navigationController?.navigationBar.topItem?.title = "Meet the team"
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

    
    private func fetchTeamMembersData() {
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

        // Configure text
        let teamMember = dataSource[indexPath.row]
        let firstName = teamMember.firstName ?? ""
        let lastName = teamMember.lastName ?? ""
        cell.line1TextLabel.text = firstName + " " + lastName
        cell.line2TextLabel.text  = teamMember.title ?? ""
        
        // Configure image
        if let url = teamMember.avatarURL {
            NetworkManager.downloadImage(atURL: url, forIdentifier: teamMember.id, completionHandler: { avatarImage in
                DispatchQueue.main.async {
                    guard avatarImage != nil else {
                        return
                    }
                    cell.avatarImageView.image = avatarImage!
                }
            })
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsViewController = TeamMemberDetails()
        detailsViewController.teamMemberToDisplay = dataSource[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath) as! TeamListTableViewCell
        detailsViewController.avatarImage = cell.avatarImageView.image!
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    

}
