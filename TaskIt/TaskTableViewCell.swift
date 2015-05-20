//
//  TaskTableViewCell.swift
//  TaskIt
//
//  Created by Jake Spirek on 4/18/15.
//  Copyright (c) 2015 Jake Spirek. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
