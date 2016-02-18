
//
//  ViewController.swift
//  TreeTableView_Swift
//
//  Created by Pengfei_Luo on 16/2/16.
//  Copyright © 2016年 骆朋飞. All rights reserved.
//

import UIKit

let headerCellID = "headerCell"
let rowCellID = "rowCell"

class ViewController: UIViewController {

    var tableView : UITableView?
    var dataArray : NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initData()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() {
        guard tableView == nil else {
            return
        }
        
        tableView = UITableView(frame: UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(20, 0, 0, 0)), style: .Plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerClass(SectionHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView?.registerNib(UINib(nibName: "SectionRowTableViewCell", bundle: nil), forCellReuseIdentifier: rowCellID)
        self.view.addSubview(tableView!)
    }
    
    /**
     初始化数据
     */
    func initData() {
        
        let node0 = TreeModel()
        node0.sonNodes = []
        node0.isExpanded = true
        let tmp1 = SectionHeaderModel()
        tmp1.headerTitle = "测试"
        node0.id = tmp1
        node0.type = .SectionHeader
        
        let node1 = TreeModel()
        node1.type = .SectionHeader
        node1.sonNodes = []
        node1.isExpanded = false
        let tmp2 = SectionHeaderModel()
        tmp2.headerTitle = "火影忍者"
        node1.id = tmp2
        
        let node2 = TreeModel()
        node2.type = .SectionHeader
        node2.sonNodes = []
        node2.isExpanded = false
        let tmp3 = SectionHeaderModel()
        tmp3.headerTitle = "测试1"
        node2.id = tmp3
        
        let node3 = TreeModel()
        node3.type = .SectionHeader
        node3.sonNodes = []
        node3.isExpanded = false
        let tmp4 = SectionHeaderModel()
        tmp4.headerTitle = "海贼王"
        node3.id = tmp4
        
        let node4 = TreeModel()
        node4.type = .SectionRow
        node4.sonNodes = []
        node4.isExpanded = false
        let tmp5 = RowModel()
        tmp5.name = "李四"
        tmp5.headerImage = "4.png"
        tmp5.des = "张三在哪？"
        node4.id = tmp5
        
        let node5 = TreeModel()
        node5.type = .SectionRow
        node5.sonNodes = []
        node5.isExpanded = false
        let tmp6 = RowModel()
        tmp6.name = "蒙奇·D·路飞"
        tmp6.headerImage = "5.png"
        tmp6.des = "草帽草帽草帽。。。。"
        node5.id = tmp6
        
        let node7 = TreeModel()
        node7.type = .SectionRow
        node7.sonNodes = []
        node7.isExpanded = false
        let tmp7 = RowModel()
        tmp7.name = "张三"
        tmp7.headerImage = "6.png"
        tmp7.des = "把头用力撞向键盘就能治好了。。"
        node7.id = tmp7
        
        let node8 = TreeModel()
        node8.type = .SectionRow
        node8.sonNodes = []
        node8.isExpanded = false
        let tmp8 = RowModel()
        tmp8.name = "鸣人"
        tmp8.headerImage = "7.png"
        tmp8.des = "最爱一乐拉面~~~"
        node8.id = tmp8

        let node9 = TreeModel()
        node9.type = .SectionRow
        node9.sonNodes = []
        node9.isExpanded = false
        let tmp9 = RowModel()
        tmp9.name = "佐助"
        tmp9.headerImage = "8.png"
        tmp9.des = "鼬的羁绊"
        node9.id = tmp9
        
        
        let node10 = TreeModel()
        node10.type = .SectionRow
        node10.sonNodes = []
        node10.isExpanded = false
        let tmp10 = RowModel()
        tmp10.name = "自来也"
        tmp10.headerImage = "9.png"
        tmp10.des = "じらいや 、JIRAIYA就这样死了"
        node10.id = tmp10
        
        node0.sonNodes = [node4,node5]
        dataArray.addObject(node0)
        node2.sonNodes = [node7]
        dataArray.addObject(node2)
        node1.sonNodes = [node8,node9,node10]
        dataArray.addObject(node1)
        node3.sonNodes = [node5]
        dataArray.addObject(node3)
    }

}

// MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let treeModel = dataArray[section] as! TreeModel
        if treeModel.isExpanded {
            return treeModel.sonNodes.count + 1
        }
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var treeModel = TreeModel()
        if indexPath.row == 0 {
            treeModel = dataArray[indexPath.section] as! TreeModel
        } else {
            let tmpModel = dataArray[indexPath.section] as! TreeModel
            treeModel = tmpModel.sonNodes[indexPath.row - 1] as! TreeModel
        }
        
        if treeModel.type == .SectionHeader {
            let cell = tableView.dequeueReusableCellWithIdentifier(headerCellID) as! SectionHeaderTableViewCell
            let headerModel = treeModel.id as! SectionHeaderModel
            cell.titleLabel?.text = headerModel.headerTitle
            let rotation = treeModel.isExpanded ? M_PI_2 : 0
            cell.arrowImageView?.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(rowCellID) as! SectionRowTableViewCell
            let rowModel = treeModel.id as! RowModel
            cell.titleLabel.text = rowModel.name
            cell.rowImageView.image = UIImage(named: rowModel.headerImage!)
            cell.detailLabel.text = rowModel.des
            return cell
        }
        
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        }
        return 70
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let treeModel = dataArray[indexPath.section] as! TreeModel
            let tmpIsExpanded = !treeModel.isExpanded
            
            for var i = 0; i < dataArray.count; i++ {
                let treeModeli = dataArray[i] as! TreeModel
                if treeModeli.isExpanded {
                    treeModeli.isExpanded = false
                }
            }
            treeModel.isExpanded = tmpIsExpanded
            tableView.reloadData()
        }
    }
}

