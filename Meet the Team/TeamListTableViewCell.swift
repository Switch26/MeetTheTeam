//
//  TeamListTableViewCell.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import UIKit

class TeamListTableViewCell: UITableViewCell {
 
    var teamMemberToDisplay = TeamMember(withID: "Unknown")
    
    let avatarImageView = UIImageView()
    var line1TextLabel = UILabel()
    var line2TextLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        constructUI()
    }
    
    func constructUI() {
    
        //Image View
        avatarImageView.image = #imageLiteral(resourceName: "avatarGenericSmall")
        avatarImageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        avatarImageView.contentMode = .scaleToFill
        
        //Text Labels
        line1TextLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        line1TextLabel.textAlignment = .left
        
        line2TextLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
        line2TextLabel.textAlignment = .left
        
        // StackViews
        let textLabelsStackView = UIStackView()
        textLabelsStackView.axis = UILayoutConstraintAxis.vertical
        textLabelsStackView.alignment = .leading
        textLabelsStackView.distribution = .fill
        textLabelsStackView.spacing = 8
        
        textLabelsStackView.addArrangedSubview(line1TextLabel)
        textLabelsStackView.addArrangedSubview(line2TextLabel)
        
        
        let imageAndTextLabelsStackView = UIStackView()
        imageAndTextLabelsStackView.axis = .horizontal
        imageAndTextLabelsStackView.alignment = .top
        imageAndTextLabelsStackView.distribution = .fill
        imageAndTextLabelsStackView.spacing = 8
        
        imageAndTextLabelsStackView.addArrangedSubview(avatarImageView)
        imageAndTextLabelsStackView.addArrangedSubview(textLabelsStackView)
        
        
        self.contentView.addSubview(imageAndTextLabelsStackView)
        
        imageAndTextLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 8)
        
        let leftConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 8)
        
        let bottomConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -8)
        
        let rightConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -8)
        
        
        self.contentView.addConstraints([topConstraint, leftConstraint, bottomConstraint, rightConstraint])

    }
    
    func updateUIWith(teamMember member: TeamMember) {
        
        let firstName = member.firstName ?? ""
        let lastName = member.lastName ?? ""
        line1TextLabel.text = firstName + lastName
        line2TextLabel.text  = member.title ?? ""
        
        if member.avatarURL != nil {

        }
        
    }

}
