//
//  PhotoCollectionViewCell.swift
//  Movie
//
//  Created by Asma hassan on 8/30/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!

    func setup(with movie: Movie) {
        
        movieImageView.kf.indicatorType = .activity
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? ""))
        movieImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "no-image-png-2"))
    }
    
}
  
