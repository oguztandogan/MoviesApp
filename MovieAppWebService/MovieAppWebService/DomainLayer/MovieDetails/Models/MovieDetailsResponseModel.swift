//
//  GetBasicTokenResponseModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class MovieDetailsResponseModel: BaseResponseProtocol {
    
    public var error: BaseErrorResponse?
    public let title, year, rated, released: String?
    public let runtime, genre, director, writer: String?
    public let actors, plot, language, country: String?
    public let awards: String?
    public let poster: String?
    public let ratings: [Rating?]
    public let metascore, imdbRating, imdbVotes, imdbID: String?
    public let type, dvd, boxOffice, production: String?
    public let website, response: String?

    
    public init(title: String?,
                year: String?,
                rated: String?,
                released: String?,
                runtime: String?,
                genre: String?,
                director: String?,
                writer: String?,
                actors: String?,
                plot: String?,
                language: String?,
                country: String?,
                awards: String?,
                poster: String?,
                ratings: [Rating?],
                metascore: String?,
                imdbRating: String?,
                imdbVotes: String?,
                imdbID: String?,
                type: String?,
                dvd: String?,
                boxOffice: String?,
                production: String?,
                website: String?,
                response: String?) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
        self.ratings = ratings
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
        self.type = type
        self.dvd = dvd
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
        self.response = response
    }
    
    public enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"    }
}
