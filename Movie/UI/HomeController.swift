//
//  HomeController.swift
//  Movie
//
//  Created by Asma hassan on 8/30/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia

class HomeController: UIViewController {

    @IBOutlet weak var myImageHome: UIImageView!
    @IBOutlet weak var realseDate: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var originalLanguage: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieFavorite: UIButton!
    @IBOutlet weak var movieName: UILabel!
    
    var movie: Movie?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewData()
    }
    

    func loadViewData() {        
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + (movie?.posterPath ?? ""))
        myImageHome.kf.setImage(with: imageURL, placeholder: UIImage(named: "no-image-png-2"))
        myDescription.text = movie?.overview
        realseDate.text = movie?.releaseDate
        movieName.text = movie?.originalTitle
        originalLanguage.text = movie?.originalLanguage
        movieRate.text = "\(movie?.voteAverage ?? 0)/5"
    }
    
}
