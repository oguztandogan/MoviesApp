//
//  RemoteConfigFetcher.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import FirebaseRemoteConfig
import FirebaseCore

enum RemoteConfigState {
    case loading
    case loaded
    case error
}

enum RemoteConfigFetcher {
    // 1
    static private(set) var state: RemoteConfigState? = nil
    // 2
    static var finishCallback: (() -> String)? = nil

    // 3
    static func fetch() {
        setDefaultValues()
        DispatchQueue.global().async {
            fetchRemoteValues()
        }
    }

    // 4
    private static func setDefaultValues() {

        let appDefaults = RemoteConfigParameters.allCases.reduce([String: NSObject]()) { (dict, param) -> [String: NSObject] in
            var dict = dict
            dict[param.rawValue] = param.defaultValue as NSObject
            return dict
        }

        RemoteConfig.remoteConfig().setDefaults(appDefaults)
    }

    // 5
    private static func fetchRemoteValues() {

        state = .loading
        let expirationDuration: TimeInterval = 0
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: expirationDuration) { (status, error) in
            defer {
                finishCallback?()
            }
            guard error == nil, status == .success else {
                state = .error
                return
            }
            RemoteConfig.remoteConfig().activate()
            state = .loaded
        }
    }
}
