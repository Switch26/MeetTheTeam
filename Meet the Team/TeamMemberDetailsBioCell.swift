//
//  TeamMemberDetailsBioCell.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/8/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import UIKit

class TeamMemberDetailsBioCell: UITableViewCell {
    
    var bioLabel = UILabel()
    var bioText = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        constructUI()
    }
    
    private func constructUI() {
        
        //Text Labels
        bioLabel.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        bioLabel.textAlignment = .left
        
        bioText.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        bioText.numberOfLines = 0
        bioText.textAlignment = .left
        
        // StackViews
        let textLabelsStackView = UIStackView()
        textLabelsStackView.axis = UILayoutConstraintAxis.vertical
        textLabelsStackView.alignment = .leading
        textLabelsStackView.distribution = UIStackViewDistribution.fill
        textLabelsStackView.spacing = 8
        
        textLabelsStackView.addArrangedSubview(bioLabel)
        textLabelsStackView.addArrangedSubview(bioText)
        
        self.contentView.addSubview(textLabelsStackView)
        
        textLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: textLabelsStackView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 4)
        
        let leftConstraint = NSLayoutConstraint(item: textLabelsStackView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 16)
        
        let bottomConstraint = NSLayoutConstraint(item: textLabelsStackView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -8)
        
        let rightConstraint = NSLayoutConstraint(item: textLabelsStackView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -8)
        
        self.contentView.addConstraints([topConstraint, leftConstraint, bottomConstraint, rightConstraint])
        
    }


}
