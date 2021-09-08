//
//  ModelTest_Asma.swift
//  
//
//  Created by Afnan MacBook Pro on 25/08/2021.
//

import Foundation

//JSON FROM "https://api.themoviedb.org/3/discover/movie?sort_by=popularity&api_key=01aa9fffbe1dfd0917b5c446f21c5fc7"

struct MovieAPI {

    var page : Int!
    var results : [Movie]!
    var totalPages : Int!
    var totalResults : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        page = dictionary["page"] as? Int
        results = [Movie]()
        if let resultsArray = dictionary["results"] as? [[String:Any]]{
            for dic in resultsArray{
                let value = Movie(fromDictionary: dic)
                results.append(value)
            }
        }
        totalPages = dictionary["total_pages"] as? Int
        totalResults = dictionary["total_results"] as? Int
    }

}

struct Movie {

    var adult : Bool!
    var backdropPath : String!
    var genreIds : [Int]!
    var id : Int!
    var originalLanguage : String!
    var originalTitle : String!
    var overview : String!
    var popularity : Int!
    var posterPath : String?
    var releaseDate : String!
    var title : String!
    var video : Bool!
    var voteAverage : Int!
    var voteCount : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        adult = dictionary["adult"] as? Bool
        backdropPath = dictionary["backdrop_path"] as? String
        genreIds = dictionary["genre_ids"] as? [Int]
        id = dictionary["id"] as? Int
        originalLanguage = dictionary["original_language"] as? String
        originalTitle = dictionary["original_title"] as? String
        overview = dictionary["overview"] as? String
        popularity = dictionary["popularity"] as? Int
        posterPath = dictionary["poster_path"] as? String
        releaseDate = dictionary["release_date"] as? String
        title = dictionary["title"] as? String
        video = dictionary["video"] as? Bool
        voteAverage = dictionary["vote_average"] as? Int
        voteCount = dictionary["vote_count"] as? Int
    }

}
