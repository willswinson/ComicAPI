//
//  APIEndpoints.swift
//  DisneyInterview
//
//  Created by William Swinson on 6/19/22.
//

import Foundation
import Alamofire

enum APIEndpoints {
    case getComic(comicId: Int)
}

extension APIEndpoints: Endpoint {
    var path: String {
        switch self {
        case .getComic(let comicId):
            return "/v1/public/comics/\(comicId)"
        }
    }

    var method: HTTPMethod {
        switch self{
        case .getComic: return .get
        }
    }

    var headers : HTTPHeaders{
        return [:]
    }
    
    var body: Parameters {
        switch self {
        case .getComic:
            return Parameters()
        }
    }
    
    static func queryParams() -> String {
        let hash = Constants.MarvelAPI.hash
        return "?ts=\(hash.ts)&apikey=\(Consts.publicKey)&hash=\(hash.token)"
    }
}
