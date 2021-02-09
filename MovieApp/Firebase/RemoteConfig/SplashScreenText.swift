//
//  SplashScreenText.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation
import FirebaseRemoteConfig
import FirebaseCore

struct LabelConfig: Codable {
    var text: String
}

struct ScreenConfig: Codable {
    var label: LabelConfig
}

enum RemoteConfigParameters: String, CaseIterable {
    case splashScreen = "splash_screen"
}

extension RemoteConfigParameters {

    var value: Codable? {
        switch self {
        case .splashScreen:
            return try? self.toCodable().get() as ScreenConfig
        }
    }

    private func toCodable<T: Codable>() -> Result<T, Error> {
        let data = RemoteConfig.remoteConfig().configValue(forKey: self.rawValue).dataValue
         return Result { try JSONDecoder().decode(T.self, from: data) }
    }
}

extension RemoteConfigParameters {
    var defaultValue: Data {
        switch self {
        case .splashScreen:
            let config = ScreenConfig(
                label: LabelConfig(
                    text: "MoviesDefault"
                )
            )
            return try! JSONEncoder().encode(config)
        }
    }
}
