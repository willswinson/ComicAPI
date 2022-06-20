//
//  Constants.swift
//  DisneyInterview
//
//  Created by William Swinson on 6/19/22.
//

import Foundation

struct Constants {
    struct MarvelAPI {
        static let baseUrl = "https://gateway.marvel.com:443"
        
        static var publicKey: String {
            getPlistString(key: "publicKey")
        }
        static var privateKey: String {
            getPlistString(key: "privateKey")
        }
        
        static var hash: (ts: Int, token: String) = {
            let ts = Int(Date.now.timeIntervalSince1970 * 1000)
            return (ts: ts, token: "\(ts)\(privateKey)\(publicKey)".md5())
        }()
        
        static func getPlistString(key: String) -> String {
            guard let path = Bundle.main.path(forResource: "MarvelTokens", ofType: "plist"),
                  let myDict = NSDictionary(contentsOfFile: path),
                  let publicKey = myDict.object(forKey: key) as? String
            else {
                fatalError("Error: Must have MarvelTokens.plist in main directory with keys publicKey and privateKey")
            }
            
            return publicKey
        }
    }
}
