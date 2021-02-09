//
//  UsecaseAssembyl.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MovieAppWebService

class UsecaseAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MovieDetailsUsecase.self, initializer: MovieDetailsUsecase.init).inObjectScope(.weak)
        container.autoregister(MoviesUsecase.self, initializer: MoviesUsecase.init).inObjectScope(.weak)
    }
}
