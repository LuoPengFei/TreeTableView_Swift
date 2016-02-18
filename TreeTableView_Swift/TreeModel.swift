//
//  TreeModel.swift
//  TreeTableView_Swift
//
//  Created by Pengfei_Luo on 16/2/16.
//  Copyright © 2016年 骆朋飞. All rights reserved.
//

import UIKit

public enum NodeType : Int {
    case SectionHeader
    case SectionRow
}

class TreeModel: NSObject {
    var type : NodeType = .SectionHeader
    var isExpanded : Bool = false
    var sonNodes : NSMutableArray = NSMutableArray()    
    var id : AnyObject?
}
