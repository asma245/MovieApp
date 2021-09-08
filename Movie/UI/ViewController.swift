//
//  ViewController.swift
//  Movie
//
//  Created by Asma hassan on 8/16/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import UIKit
import  Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        let request = Request()
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        request.getService(url, .get, nil, ["sort_by":"popularity","api_key":"01aa9fffbe1dfd0917b5c446f21c5fc7"]) { result in	
            self.movies = MovieAPI(fromDictionary: result).results
            self.collectionView.reloadData()
        }
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.setup(with: movies[indexPath.row])
        cell.contentView.clipsToBounds = true
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wieghts = collectionView.bounds.width-30
        //let heights = collectionView.bounds.height
        return CGSize(width: wieghts/2 , height: wieghts/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeController") as? HomeController
        vc?.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
//        print(.title)
    }
}

