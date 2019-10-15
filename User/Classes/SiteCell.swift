//
//  SiteCell.swift
//  w4Table2
//
//  Created by Vandan  on 9/27/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit

class SiteCell: UITableViewCell {
    
    
    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    let myImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        primaryLabel.textAlignment = .left
        primaryLabel.font = UIFont.systemFont(ofSize: 30,weight: .bold)
        primaryLabel.textColor = .black
        primaryLabel.backgroundColor = .clear
        
        secondaryLabel.textAlignment = .left
        secondaryLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        secondaryLabel.backgroundColor = .clear
        secondaryLabel.textColor = .blue
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(myImageView)
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        primaryLabel.frame = CGRect(x: 100, y: 5, width: 460, height: 30)
        secondaryLabel.frame = CGRect(x: 100, y: 40, width: 460, height: 20)
        myImageView.frame = CGRect(x: 5, y: 5, width: 45, height: 45)
        
        
    }

   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
