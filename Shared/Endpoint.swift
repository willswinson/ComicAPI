//
//  Endpoint.swift
//  DisneyInterview
//
//  Created by William Swinson on 6/19/22.
//

typealias Consts = Constants.MarvelAPI

import Foundation
import Alamofire

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var fullURL: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var body: Parameters { get }
    var headers: HTTPHeaders { get }
    
    static func queryParams() -> String
}

public extension Endpoint {
    var encoding: ParameterEncoding {
        method == .get ? URLEncoding.default : JSONEncoding.default
    }

    var fullURL: String {
        baseURL + path + Self.queryParams()
    }

    var body: Parameters {
        Parameters()
    }

    var headers: HTTPHeaders{
        [:]
    }

    var baseURL: String {
        Constants.MarvelAPI.baseUrl
    }
}
