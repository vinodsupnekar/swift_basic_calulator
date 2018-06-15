//
//  DifferentTableViewCell.swift
//  Calculator
//
//  Created by vinods on 1/29/18.
//  Copyright © 2018 vinods. All rights reserved.
//

import UIKit

class DifferentTableViewCell: UITableViewCell {

 static  var reuseIdentifier: String{
  return "DifferentTableViewCell"
 }
 
 @IBOutlet var customLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//     customLabel = UILabel(frame:CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height))
//     customLabel.textAlignment = .center
//     contentView.addSubview(customLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
