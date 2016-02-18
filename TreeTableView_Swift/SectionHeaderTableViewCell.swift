//
//  SectionHeaderTableViewCell.swift
//  TreeTableView_Swift
//
//  Created by Pengfei_Luo on 16/2/16.
//  Copyright © 2016年 骆朋飞. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

    var arrowImageView : UIImageView?
    var titleLabel : UILabel?
    var headerModel : TreeModel?
    
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImageView()
        setTitleLabel()
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setImageView() {
        
        guard arrowImageView == nil else {
            return
        }
        arrowImageView = UIImageView(frame: CGRectMake(5, 5, 20, 20))
        arrowImageView?.image = UIImage(named: "the_arrow.png")
        self.contentView.addSubview(arrowImageView!)
    }
    
    private func setTitleLabel() {
        guard titleLabel == nil else {
            return
        }
        
        titleLabel = UILabel(frame: CGRectMake(30, 5, 150, 20))
        self.contentView.addSubview(titleLabel!)
    }

}
