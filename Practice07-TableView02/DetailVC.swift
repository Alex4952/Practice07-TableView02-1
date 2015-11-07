//
//  DetailVC.swift
//  Practice07-TableView02
//
//  Created by Mac on 2015. 11. 7..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

class DetailVC: UITableViewController {
	
	var mvo : MovieVO?

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var ratingLabel: UILabel!
	@IBOutlet var opendateLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.titleLabel.text = mvo?.title
		self.ratingLabel.text = "\((mvo?.rating)!)" // Optional 해제: 괄호로 한번 더 묶어야 함.
		self.opendateLabel.text = mvo?.opendate

    }


}
