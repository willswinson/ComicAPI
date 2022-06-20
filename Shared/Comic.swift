//
//  Comic.swift
//  DisneyInterview
//
//  Created by William Swinson on 6/19/22.
//

import Foundation

struct ComicResponse: Codable {
    let data: ComicResponseData
}

struct ComicResponseData: Codable {
    let results: [Comic]
}

struct Comic: Codable {
    let title: String
    let description: String
    let images: [ComicThumbnail]
}

struct ComicThumbnail: Codable {
    let path: String
}
