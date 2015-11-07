//
//  ListViewController.swift
//  Practice07-TableView02
//
//  Created by Mac on 2015. 11. 7..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit


// 프로토타입 셀을 여려개(Table View > Prototype Cells : 3) 만들수도 있음. 필요에 따라.
// 아이덴티파이어의 이름을 다르게(cell1, cell2, cell3) 줘서 케이스별로 다르게 구성하는것도 가능 (음악셀, 영화셀)
class ListViewController : UITableViewController {
	
	// 테이블 뷰를 구성할 리스트 데이터를 담을 배열 변수 ( = [MovieVO]() )
	var list = Array<MovieVO>()
//	var imgList = [String]()
	
	override func viewDidLoad() {
//		imgList.append("juez")
//		imgList.append("lap[es")
//		imgList.append("laptop en el cielo")
		
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
		mvo.rating = 2.74
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
		
//		let cell = tableView.dequeueReusableCellWithIdentifier("cell") ?? UITableViewCell() // 닐이면 새로운 셀을 만들어라.
//		cell.textLabel?.text = self.list[indexPath.row].title
//		cell.detailTextLabel?.text = self.list[indexPath.row].description
		//		cell.imageView?.image = UIImage(named: self.imgList[indexPath.row])
		
/*
		// Tag로 읽어옴. (Outlet을 연결하지 않음, Tag를 이용해서 계속 찍어내야 함)
		let movieTitle = cell.viewWithTag(101) as? UILabel
		let movieDetail = cell.viewWithTag(102) as? UILabel
		let movieOpendate = cell.viewWithTag(103) as? UILabel
		let movieRatingImg = cell.viewWithTag(104) as? UIImageView
		
		movieTitle?.text = self.list[indexPath.row].title
		movieDetail?.text = self.list[indexPath.row].description
		movieOpendate?.text = self.list[indexPath.row].opendate
		movieRatingImg?.image = self.getRatingImage(self.list[indexPath.row].rating!)
*/

		// 커스텀 프로토타입셀 : 프로토타입셀을 별도의 클래스로 만들었음. (직접 outlet을 만들어서 연결하였으므로 관리하기가 더 용이, 이 방법을 추천)
		let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? MovieCell ?? MovieCell()
		
		cell.movieTitle.text = self.list[indexPath.row].title
		cell.detail.text = self.list[indexPath.row].description
		cell.opendate.text = self.list[indexPath.row].opendate
		cell.ratingImage.image = self.getRatingImage(self.list[indexPath.row].rating!)
		
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
			// 이 부분에서 넘어가는 페이지에있는 객체에 바로 전달. (mvo)
			uvc.mvo = self.list[indexPath.row]
			
			self.navigationController?.pushViewController(uvc, animated: true)
		}
	}
	
	func getRatingImage(rate: Float) -> UIImage? {
		let rating = Int(rate/2) // 소수점 이하 버림
	
//		return UIImage(named: "\(rating)StarsSmall.png")
		
		switch rating {
			case 1: return UIImage(named: "1StarsSmall.png")
			case 2: return UIImage(named: "2StarsSmall.png")
			case 3: return UIImage(named: "3StarsSmall.png")
			case 4: return UIImage(named: "4StarsSmall.png")
			case 5: return UIImage(named: "5StarsSmall.png")
			default: return nil // 오류는 안나고 화면에 안그려질 뿐.
		}
		
/*
		if rating == 1 {
			return UIImage(named: "1StarsSmall.png")
		}
		else if rating == 2 {
			return UIImage(named: "2StarsSmall.png")
		}
		else if rating == 3 {
			return UIImage(named: "3StarsSmall.png")
		}
		else if rating == 4 {
			return UIImage(named: "4StarsSmall.png")
		}
		else if rating == 5 {
			return UIImage(named: "5StarsSmall.png")
		}
		else {
			return UIImage(named: "5StarsSmall.png")
		}
*/
	}
	
}
