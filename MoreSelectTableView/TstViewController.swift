//
//  TstViewController.swift
//  MoreSelectTableView
//
//  Created by 恒 韩 on 17/4/21.
//  Copyright © 2017年 co. All rights reserved.
//

import UIKit



class TstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var selectedCellArray: Array<IndexPath>!
    var testTableView: UITableView!
    var section: Int!
    let dataArray = ["a","b","c","d","e"]
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCellArray = NSArray.init() as! Array<IndexPath>
        testTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kscreenHeight), style: .grouped
        )
        testTableView.delegate = self
        testTableView.dataSource = self
        self.view.addSubview(testTableView)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
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
        var testCell = tableView.dequeueReusableCell(withIdentifier: "testCell")
        
        if testCell == nil {
            testCell = UITableViewCell.init(style: .default, reuseIdentifier: "testCell")
        }
        //判断cell是否被选中
        if selectedCellArray.contains(indexPath) {
            testCell?.accessoryType = .checkmark
        }else{
            testCell?.accessoryType = .none
        }
        testCell?.textLabel?.text = "\(dataArray[indexPath.row])"
        return testCell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = selectedCellArray.index(of: indexPath) {
            selectedCellArray.remove(at: index)
        }else{
            selectedCellArray.append(indexPath)
        }
        //刷新该行cell
        self.testTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
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
