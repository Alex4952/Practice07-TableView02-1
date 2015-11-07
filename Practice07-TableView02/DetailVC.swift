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
		self.ratingLabel.text = "\((mvo?.rating)!)"
		self.opendateLabel.text = mvo?.opendate

    }


}
