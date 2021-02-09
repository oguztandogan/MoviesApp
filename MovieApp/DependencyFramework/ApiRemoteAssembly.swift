//
//  ApiRemoteAssembly.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MovieAppWebService

class ApiRemoteAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MovieDetailsOperationsRemoteInterface.self, initializer: MovieDetailsOperationsRemote.init).inObjectScope(.weak)
        container.autoregister(MoviesOperationsRemoteInterface.self, initializer: MoviesOperationsRemote.init).inObjectScope(.weak)
    }
}
