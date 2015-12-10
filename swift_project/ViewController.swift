//
//  ViewController.swift
//  swift_project
//
//  Created by 赫腾飞 on 15/12/10.
//  Copyright © 2015年 hetefe. All rights reserved.
//

 /**
    --搭建简易界面
    1 创建模型
    2 下载数据 转换模型
    3 创建Cell类 实现tableView的数据源方法
    4
*/

import UIKit

class ViewController: UITableViewController {

//MARK: - 为什么使用private
    private var persons: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        self.tableVi
        loadData { (array) -> () in
            self.persons = array
            
            self.tableView.reloadData()
        }
        
    }
    
}

// MARK: - segue的传值

extension ViewController{

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //获取控制器
        let vc = segue.destinationViewController as! DetailViewController
        
        //获取数据 点击的哪里额
        if let index = tableView.indexPathForSelectedRow{
        
            //把值传过去  已经if let 可以 ！
            vc.person = persons![index.row]
        
            //数据回调 刷新
            
            vc.callBack = {
                print("vc.person = \(vc.person)")
                
                print("persons = \(self.persons![index.row])")
                self.tableView.reloadData()
            }
        }
        
    }

}



// MARK: - tableView 代理方法
extension ViewController{

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.persons?.count ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: PersonTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PersonTableViewCell
        
        cell.person = persons?[indexPath.row]
        
        return cell
    
    }

}


// MARK: - 模拟数据下载
extension ViewController{
    
    //异步获取
    func loadData(finish:(array: [Person]) ->()){
    
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
            //定义一个数组存放数据 模型数组
            var dataList = [Person]()
            
            for i in 0...50{
                
                let name = "James\(i)"
                
                let age = random() % 80 + 10
                
                let dic:[String :AnyObject] = ["name":name, "age": age]
                
                //字典转模型

                let person = Person(dic: dic)
                
                dataList.append(person)
            }
            
            print(dataList)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("完成回调")
                
                finish(array: dataList)
            })
   
        }
        
    }
    
    
    
    
    
}
