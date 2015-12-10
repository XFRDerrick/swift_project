//
//  DetailViewController.swift
//  swift_project
//
//  Created by 赫腾飞 on 15/12/10.
//  Copyright © 2015年 hetefe. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {

    //接受数据
    var person:Person?
    
    //定义闭包进行函数的回调
    
    var callBack:( () -> () )?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = person?.name
        
        ageTextField.text = "\(person?.age ?? 0)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textChange(sender: AnyObject) {
        
        navigationItem.rightBarButtonItem?.enabled = nameTextField.hasText() && ageTextField.hasText()
        
    }

    @IBAction func save(sender: UIBarButtonItem) {
        
        //地址传递
        
        person?.name = nameTextField.text
        
//        person?.age = Int(ageTextField.text!)!
        person?.age = Int(ageTextField.text!) ?? 0
        
        callBack!()
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
