//
//  DetailViewController.swift
//  TableView
//
//  Created by kaki on 2022/12/04.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func setupUI() {
        mainImageView.image = movieData?.movieImage // 둘 다 옵셔널 타입이라 바인딩 필요 없음
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }


}
