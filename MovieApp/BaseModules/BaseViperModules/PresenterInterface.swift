//
//  PresenterInterface.swift
//  Movee
//
//  Created by Oguz Tandogan on 17.11.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//


protocol PresenterInterface: class {
    func viewDidLoad()
    func displayWarningPopup()
    func displayWarningPopup(data: WireframeDataProtocol?, completion: (() -> Void)?)
}

extension PresenterInterface {
    func viewDidLoad() {}
    func displayWarningPopup() {}
    func displayWarningPopup(data: WireframeDataProtocol?, completion: (() -> Void)?) {}
}
