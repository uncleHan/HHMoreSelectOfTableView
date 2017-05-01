//
//  ViewController.swift
//  MoreSelectTableView
//
//  Created by 恒 韩 on 17/4/21.
//  Copyright © 2017年 co. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kscreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var testTableView: UITableView!
    let titleArray = ["第一种方式","第二种方式","使用系统方式"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kscreenHeight), style: .plain
        )
        testTableView.delegate = self
        testTableView.dataSource = self
        self.view.addSubview(testTableView)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var testCell = tableView.dequeueReusableCell(withIdentifier: "testCell")
        
        if testCell == nil {
            testCell = UITableViewCell.init(style: .default, reuseIdentifier: "testCell")
        }
        
        testCell?.textLabel?.text = "\(titleArray[indexPath.row])"
        return testCell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let testVC = TstViewController()
        
        switch indexPath.row {
        case 0:
            //点击一个section
           testVC.section = 1
           testVC.navigationItem.title = "一个section"
           self.navigationController? .pushViewController(testVC, animated: true)
            
        case 1:
            //多个section
            let secondVC = SecondViewController()
            self.navigationController? .pushViewController(secondVC, animated: true)
        case 2:
            //系统
             let thirdVC = ThirdViewController()
            self.navigationController? .pushViewController(thirdVC, animated: true)
        default:
            break;
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

