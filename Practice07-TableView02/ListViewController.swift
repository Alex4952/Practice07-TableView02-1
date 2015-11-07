//
//  ListViewController.swift
//  Practice07-TableView02
//
//  Created by Mac on 2015. 11. 7..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

// 맨 밑의 셀이 보이도록 하려면?
class ListViewController : UITableViewController {
	
	// 테이블 뷰를 구성할 리스트 데이터를 담을 배열 변수 ( = [MovieVO]() )
	var list = Array<MovieVO>()
	
	override func viewDidLoad() {
		var mvo = MovieVO()
		mvo.title = "Dark Knight"
		mvo.description = "배트맨 비긴즈의 속편"
		mvo.opendate = "2008-08-06"
		mvo.rating = 8.95
		self.list.append(mvo)
		
		mvo = MovieVO()
		mvo.title = "Avengers"
		mvo.description = "영웅들이 총집합하는 히어로물"
		mvo.opendate = "2012-04-11"
		mvo.rating = 8.74
		self.list.append(mvo)

		mvo = MovieVO()
		mvo.title = "Thor"
		mvo.description = "뇌신 토르의 정의사회 구현하기"
		mvo.opendate = "2011-04-18"
		mvo.rating = 7.31
		self.list.append(mvo)
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.list.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("cell") ?? UITableViewCell() // 닐이면 새로운 셀을 만들어라.
		cell.textLabel?.text = self.list[indexPath.row].title
		cell.detailTextLabel?.text = self.list[indexPath.row].description
		
		return cell
	}
/*
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		//셀을 여기서 생성
		//let cell = UITableViewCell()
		
		// 스토리 보드의 프로토타입 셀을 읽어옴
		let cell = tableView.dequeueReusableCellWithIdentifier("cell") ?? UITableViewCell() // 닐이면 새로운 셀을 만들어라.
		cell.textLabel?.text = "\(indexPath.row) 행입니다"
		cell.detailTextLabel?.text = "여기는 보조 데이터 영역입니다"
		//		cell.imageView = UIImageView(UIImage(contentsOfFile: "juez"))
		return cell
	}
*/
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		NSLog("\(self.list[indexPath.row].title!)이 클릭되었습니다.")
		
		if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as? DetailVC {
			
			// 스토리보드에서 셀이 아닌 상단의 컨트롤러 선택아이콘에서 드래그 하여 [매뉴얼세그웨이/show] 로 연결해놓음.(화면상에 네이게이션 영역 표시됨)
			// 스토리보드의 DetailVC 화면에 네비게이션 영역표시 용도로만 연결함 (없어도 실제 구동시에는 네비게이션 영역 표시됨)
			// 이 부분에서 넘어가는 페이지에 바로 객체를 넘겨버림
			uvc.mvo = self.list[indexPath.row]
			
			self.navigationController?.pushViewController(uvc, animated: true)
		}
	}
	
	
}
