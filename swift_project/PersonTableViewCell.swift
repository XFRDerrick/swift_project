//
//  PersonTableViewCell.swift
//  swift_project
//
//  Created by 赫腾飞 on 15/12/10.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var ageLable: UILabel!
    
    //设置Cell的值
    var person :Person?{
    
        didSet{
        
            nameLable.text = person?.name
            
            ageLable.text = "\(person?.age ?? 0)"
            
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
