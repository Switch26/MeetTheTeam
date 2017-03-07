//
//  TeamListTableViewCell.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import UIKit

class TeamListTableViewCell: UITableViewCell {
   
    let avatarImageView = UIImageView()
    var line1TextLabel = UILabel()
    var line2TextLabel = UILabel()
    var textLabelsStackView = UIStackView()
    
    var imageViewHeightConstraint: NSLayoutConstraint?
    var imageViewWidthConstraint: NSLayoutConstraint?
    
    var imageHeightAndWidth = CGFloat(50) {
        didSet {
            imageViewHeightConstraint?.isActive = false
            imageViewHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: imageHeightAndWidth)
            imageViewHeightConstraint?.isActive = true
            
            imageViewWidthConstraint?.isActive = false
            imageViewWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: imageHeightAndWidth)
            imageViewWidthConstraint?.isActive = true
            
            avatarImageView.layer.cornerRadius = imageHeightAndWidth / 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        constructUI()
    }
    
    func constructUI() {
    
        //Image View
        imageViewHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: imageHeightAndWidth)
        imageViewHeightConstraint?.isActive = true
        
        imageViewWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: imageHeightAndWidth)
        imageViewWidthConstraint?.isActive = true
        
        avatarImageView.layer.cornerRadius = imageHeightAndWidth / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleToFill
        
        //Text Labels
        line1TextLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        line1TextLabel.textAlignment = .left
        
        line2TextLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
        line2TextLabel.textAlignment = .left
        
        // StackViews
        textLabelsStackView.axis = UILayoutConstraintAxis.vertical
        textLabelsStackView.alignment = .leading
        textLabelsStackView.distribution = UIStackViewDistribution.fill
        textLabelsStackView.spacing = 8
        
        textLabelsStackView.addArrangedSubview(line1TextLabel)
        textLabelsStackView.addArrangedSubview(line2TextLabel)
        
        
        let imageAndTextLabelsStackView = UIStackView()
        imageAndTextLabelsStackView.axis = .horizontal
        imageAndTextLabelsStackView.alignment = .top
        imageAndTextLabelsStackView.distribution = .fill
        imageAndTextLabelsStackView.spacing = 16
        
        imageAndTextLabelsStackView.addArrangedSubview(avatarImageView)
        imageAndTextLabelsStackView.addArrangedSubview(textLabelsStackView)
        
        
        self.contentView.addSubview(imageAndTextLabelsStackView)
        
        imageAndTextLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 8)
        
        let leftConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 16)
        
        let bottomConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -8)
        
        let rightConstraint = NSLayoutConstraint(item: imageAndTextLabelsStackView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -8)
        
        self.contentView.addConstraints([topConstraint, leftConstraint, bottomConstraint, rightConstraint])

    }

}
