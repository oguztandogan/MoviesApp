//
//  Wireframes.swift
//  Movee
//
//  Created by Oguz Tandogan on 17.11.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

public enum Wireframes {

    public typealias Value = BaseWireframe

    case moviesWireframe
    case movieDetailsWireframe(String?)

    public var value: BaseWireframe {
        switch self {
        case .moviesWireframe:
            return MoviesWireframe()
        case .movieDetailsWireframe(let movieId):
            return MovieDetailsWireframe(movieId: movieId)
        }
    }
}
