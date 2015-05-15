//
//  Router.swift
//  bout
//
//  Created by Steven Lu on 10/1/14.
//  Copyright (c) 2014 Steven Lu. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "http://imparcel.com"

    case Packages()

    var method: Alamofire.Method {
        switch self {
        default: return .GET
        }
    }

    var path: String {
        switch self {
        case .Packages: return "/api/emails/55406f04b0be3503001292fe/packages"
        default: return ""
        }
    }

    // MARK: URLRequestConvertible

    var URLRequest: NSURLRequest {
        let urlString = Router.baseURLString + self.path;
        let URL = NSURL(string: urlString)
        let mutableURLRequest = NSMutableURLRequest(URL: URL!)
        mutableURLRequest.HTTPMethod = method.rawValue

        switch self {
        default:
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        }
    }
}