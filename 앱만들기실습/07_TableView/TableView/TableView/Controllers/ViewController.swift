//
//  ViewController.swift
//  TableView
//
//  Created by kaki on 2022/12/04.
//

import UIKit

class ViewController: UIViewController {

//    var moviesArray: [Movie] = [ ]
    
    var movieDataManager = DataManager() // MVC 패턴을 위한 데이터 매니저

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self // 델리게이트가 아닌 데이터소스
        // 이름만 데이터소스지만 결국 델리게이트 패턴 - 이름만 조금 다를뿐
        // ⭐️ 데이터소스 프로토콜에 대한 대리자 ⭐️
        
        tableView.rowHeight = 120  // 테이블뷰 속 셀의 높이 - 스토리보드에서도 설정 가능
        
        tableView.delegate = self
        // ⭐️ 델리게이트 프로토콜에 대한 대리자 ⭐️
        
        movieDataManager.makeMovieData()
//        moviesArray = movieDataManager.getMovieData()
    }

}

                // ⭐️ 테이블뷰를 사용하기 위해선 프로토콜 채택 필수! ⭐️
extension ViewController: UITableViewDataSource {
    
    // 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이토 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
                            // 힙에 올라간 재사용 가능한 셀을 꺼내서 사용하는 메서드
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        indexPath.section - 테이블뷰를 그룹으로 만들었을때 그룹에 해당함 -> 그룹의 번호
//        indexPath.row  - 정확한 행 / 몇 번째 녀석인지 -> 그룹 내에 몇번째 행인지
        
        let movie = movieDataManager.getMovieData()[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none  // 클릭했을때 뜨는 색 - 기본은 회색
        
        return cell
    }
    
}


extension ViewController: UITableViewDelegate {
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }
    // prepare 세그웨이 (디음 화면으로 데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            
            let indexPath = sender as! IndexPath
            
            // 우리가 전달하기 원하는 영화 데이터 -> 배열에서 아이템을 꺼내서 다음화면으로 전달
            detailVC.movieData = array[indexPath.row]
        }
    }
    
}
