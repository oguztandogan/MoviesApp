//
//  MoviesListResponseModel.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation

public class MoviesListResponseModel: BaseResponseProtocol {
    
    public var error: BaseErrorResponse?
    public let title: String?
    public let year: String?
    public let imdbId: String?
    public let type: String?
    public let poster: String?
    
    public init(title: String?,
                year: String?,
                imdbId: String?,
                type: String?,
                poster: String?) {
        self.title = title
        self.year = year
        self.imdbId = imdbId
        self.type = type
        self.poster = poster
    }
    
    public enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

// MARK: - Rating
public class Rating: Codable {
    public let source, value: String?
    
    public init(source: String?,
                value: String?) {
        self.source = source
        self.value = value
    }
    
    public enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

public class Type: Codable {
    public let movies: String?
    public let series: String?
    public let episode: String?
    
    public init(movies: String?,
                series: String?,
                episode: String?) {
        self.movies = movies
        self.series = series
        self.episode = episode
    }
}
