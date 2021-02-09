//
//  RepositoryAssembly.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MovieAppWebService

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MovieDetailsOperationsRepositoryInterface.self, initializer: MovieDetailsOperationsRepository.init).inObjectScope(.weak)
        container.autoregister(MoviesOperationsRepositoryInterface.self, initializer: MoviesOperationsRepository.init).inObjectScope(.weak)
    }
}
