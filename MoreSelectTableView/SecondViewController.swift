//
//  SecondViewController.swift
//  MoreSelectTableView
//
//  Created by 恒 韩 on 17/4/27.
//  Copyright © 2017年 co. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let secondDatas = ["A","B","C","D","E"]
    var _secondTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "第二种方式"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "确定", style: .done, target: self, action: #selector(confirm))
        
       _secondTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
       _secondTableView.delegate = self
        _secondTableView.dataSource = self
        _secondTableView.allowsMultipleSelection = true
        self.view.addSubview(_secondTableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondDatas.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 30))
        let headerLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: headerView.bounds.width, height: 30))
        headerLabel.text = "section \(section + 1)"
        headerLabel.backgroundColor = UIColor.lightGray
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var secondCell = tableView.dequeueReusableCell(withIdentifier: "secondCell")
        if secondCell == nil {
            secondCell = UITableViewCell.init(style: .default, reuseIdentifier: "secondCell")
        }
        secondCell?.textLabel?.text = "\(secondDatas[indexPath.row])"
        
        return secondCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .none
    }
    
    func confirm(){
        
        if let selectCells = _secondTableView.indexPathsForSelectedRows {
            for indexPath in selectCells{
                print(indexPath)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
