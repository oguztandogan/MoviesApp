//
//  ApiProviderServiceAssembly.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MovieAppWebService

class ApiProviderServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MovieDetailsServices.self, initializer: MovieDetailsServices.init).inObjectScope(.weak)
        container.autoregister(MoviesServices.self, initializer: MoviesServices.init).inObjectScope(.weak)
    }
}
