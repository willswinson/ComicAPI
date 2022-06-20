//
//  ComicViewModel.swift
//  DisneyInterview
//
//  Created by William Swinson on 6/19/22.
//

import Foundation
import Combine
import SwiftUI
import Alamofire

class ComicViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    @Published var comicResponse: ComicResponse?
    
    init(comicId: Int) {
        getComic(comicId: comicId)
    }
    
    func comicImageUrl() -> URL? {
        guard let comic = comicResponse?.data.results.first else { return nil }
        return URL(string: "\(comic.images.first?.path ?? "")")
    }
    
    func getComic(comicId: Int) {
        let url = APIEndpoints.getComic(comicId: comicId).fullURL
        
        Alamofire.request(url,
                          method: .get).responseData { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let comicResponse = try decoder.decode(ComicResponse.self, from: data)
                    self.comicResponse = comicResponse
                } catch let error {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
