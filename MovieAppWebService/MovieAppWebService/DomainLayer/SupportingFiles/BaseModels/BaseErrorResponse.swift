//
//  BaseErrorResponse.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class BaseErrorResponse: Codable, Error {
    public let statusCode: Int?
    public let statusMessage: String?
    public let success: Bool?
    
    
    public init(statusCode: Int? = nil, statusMessage: String? = nil, success: Bool? = nil) {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
        self.success = success
    }
    
    public enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success = "success"
    }
}
