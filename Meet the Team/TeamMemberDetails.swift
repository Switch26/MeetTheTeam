//
//  TeamMemberDetails.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import UIKit

class TeamMemberDetails: UITableViewController {
    
    var teamMemberToDisplay = TeamMember(withID: "Unknown")
    var avatarImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UITableView properties
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.allowsSelection = false
        
        //self.navigationController?.navigationBar.topItem?.title = "Meet FirstName"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            let cell = TeamListTableViewCell()
            
            let firstName = teamMemberToDisplay.firstName ?? ""
            let lastName = teamMemberToDisplay.lastName ?? ""
            cell.line1TextLabel.text = firstName + " " + lastName
            cell.line2TextLabel.text  = teamMemberToDisplay.title ?? ""
            
            cell.imageHeightAndWidth = CGFloat(100)
            cell.textLabelsStackView.distribution = UIStackViewDistribution.fillProportionally
            cell.avatarImageView.image = avatarImage
            
            return cell

        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }

}
