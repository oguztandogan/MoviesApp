//
//  AssemblerWireframeInteractorProtocol.swift
//  Movee
//
//  Created by Oguz Tandogan on 17.11.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.


import Foundation
import Swinject

protocol AssemblerWireframeInteractorProtocol {
    
}

extension AssemblerWireframeInteractorProtocol {
    
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}
