//
//  HeadlineCell.swift
//  JSOnPagination
//
//  Created by Divya Pandit Chhetri on 8/21/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import Foundation
import UIKit

class HeadlineCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: 130, y: textLabel!.frame.origin.y, width: contentView.frame.width - 125, height: textLabel!.frame.height)
        textLabel?.numberOfLines = 0
        
    }
    var iconImageView = UIImageView()
    var label = UILabel()
    func setUpLayout() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(iconImageView)
        
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        iconImageView.contentMode = .scaleAspectFit
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

