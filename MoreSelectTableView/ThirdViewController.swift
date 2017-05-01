//
//  ThirdViewController.swift
//  MoreSelectTableView
//
//  Created by 恒 韩 on 17/4/27.
//  Copyright © 2017年 co. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let keys: NSArray = ["初一","初二","初三"]
    var thirdDatas = NSMutableArray.init()
    var selectedString : Array<String>!
    var _thirdTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedString = NSArray.init() as! Array<String>
        let oneDic: [String : NSMutableArray] =  [keys[0] as! String : ["语文","数学","英语"]]
        let twoDic: [String : NSMutableArray] = [keys[1] as! String : ["历史","生物","物理"]]
        let threeDic: [String : NSMutableArray] = [keys[2] as! String : ["化学","体育","音乐"]]

        
        thirdDatas.add(oneDic)
        thirdDatas.add(twoDic)
        thirdDatas.add(threeDic)
        self.navigationItem.title = "第三种方式"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .done, target: self, action: #selector(confirm))
        
        _thirdTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        _thirdTableView.delegate = self
        _thirdTableView.dataSource = self
        _thirdTableView.allowsMultipleSelectionDuringEditing = true
        self.view.addSubview(_thirdTableView)
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return thirdDatas.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var sectionArray = NSMutableArray.init()
        var tempDic = NSDictionary.init()
        
        switch section {
        case 0:
            tempDic = thirdDatas[section] as! NSDictionary
            sectionArray = tempDic.object(forKey: "初一") as! NSMutableArray
        case 1:
            tempDic = thirdDatas[section] as! NSDictionary
            sectionArray = tempDic.object(forKey: "初二") as! NSMutableArray
        case 2:
            tempDic = thirdDatas[section] as! NSDictionary
            sectionArray = tempDic.object(forKey: "初三") as! NSMutableArray
        default:
           print("ok")
        }
        return sectionArray.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 30))
        let headerLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: headerView.bounds.width, height: 30))
        headerLabel.text = "\(keys[section])"
        headerLabel.backgroundColor = UIColor.lightGray
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var secondCell = tableView.dequeueReusableCell(withIdentifier: "secondCell")
        if secondCell == nil {
            secondCell = UITableViewCell.init(style: .default, reuseIdentifier: "secondCell")
        }
        
        let dic = thirdDatas[indexPath.section]
        let key = (dic as AnyObject).allKeys.first as! String
        let array = (dic as AnyObject).object(forKey: key) as! NSArray
        
        secondCell?.textLabel?.text = "\(array[indexPath.row])"
        
        return secondCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //声明一个数组,存储选中的值
        let str = (thirdDatas.object(at: indexPath.section) as! [String : NSMutableArray])[keys[indexPath.section] as! String]?[indexPath.row] as! String
        selectedString.append(str)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let str = (thirdDatas.object(at: indexPath.section) as! [String : NSMutableArray])[keys[indexPath.section] as! String]?[indexPath.row] as! String
        
        if let myint = selectedString.index(of: str) {
            selectedString.remove(at: myint)
        }
        
    }
    
    func confirm(){
        if _thirdTableView.isEditing {
            //删除操作
            var selectedCells = [IndexPath]()
            if let selecteds = _thirdTableView.indexPathsForSelectedRows{
                for selecIndexPath in selecteds{
                    selectedCells.append(selecIndexPath)
                    print(selecIndexPath)
                }
            }
            //删除选中的数据
            for selecedIndexPath in selectedCells{
                //不能根据下标删除,容易下标越界
                print(selectedString)
                
                let tempArray = (thirdDatas.object(at: selecedIndexPath.section) as! [String : NSMutableArray])[keys[selecedIndexPath.section] as! String]
                if selecedIndexPath.row < (tempArray?.count)! {
                    (thirdDatas.object(at: selecedIndexPath.section) as! [String : NSMutableArray])[keys[selecedIndexPath.section] as! String]?.removeObject(at: selecedIndexPath.row)
                }else{
                    
                }
           
                print("section:    \(selecedIndexPath.section)" + "row:     \(selecedIndexPath.row)" + "key:    \(keys[selecedIndexPath.section])")
                print(thirdDatas)
            }
            _thirdTableView.reloadSections(IndexSet.init(arrayLiteral: 0,1,2), with: UITableViewRowAnimation.automatic)
            _thirdTableView.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "编辑"
            
        }else{
            _thirdTableView.setEditing(true, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "删除"
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
