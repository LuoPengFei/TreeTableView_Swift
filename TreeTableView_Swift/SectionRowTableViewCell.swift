//
//  SectionRowTableViewCell.swift
//  TreeTableView_Swift
//
//  Created by Pengfei_Luo on 16/2/16.
//  Copyright © 2016年 骆朋飞. All rights reserved.
//

import UIKit

class SectionRowTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rowImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
