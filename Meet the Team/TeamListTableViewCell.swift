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
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        //Image View
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "avatarGenericSmall")
        imageView.contentMode = .scaleToFill
        
        //Text Labels
        let line1TextLabel = UILabel()
        line1TextLabel.text  = "FirstName LastName"
        line1TextLabel.textAlignment = .left
        //line1TextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let line2TextLabel = UILabel()
        line2TextLabel.text  = "Occupation"
        line2TextLabel.textAlignment = .left
        //line2TextLabel.translatesAutoresizingMaskIntoConstraints = false

        
        
        let textLabelsStackView = UIStackView()
        textLabelsStackView.axis = .vertical
        textLabelsStackView.alignment = .leading
        textLabelsStackView.distribution = .fill
        textLabelsStackView.spacing = 8
        
        textLabelsStackView.addArrangedSubview(line1TextLabel)
        textLabelsStackView.addArrangedSubview(line2TextLabel)
        
        
        let imageAndTextLabelsStackView = UIStackView()
        textLabelsStackView.axis = .horizontal
        textLabelsStackView.alignment = .top
        textLabelsStackView.distribution = .fill
        textLabelsStackView.spacing = 8
        
        imageAndTextLabelsStackView.addArrangedSubview(imageView)
        imageAndTextLabelsStackView.addArrangedSubview(textLabelsStackView)
        
        
        self.contentView.addSubview(imageAndTextLabelsStackView)
        
        imageAndTextLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 8)
        
        let leftConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 8)
        
        let bottomConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -8)
        
        let rightConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -8)
        
        
        self.contentView.addConstraints([topConstraint, leftConstraint, bottomConstraint, rightConstraint])
        
    }

}
