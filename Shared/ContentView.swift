//
//  ContentView.swift
//  Shared
//
//  Created by William Swinson on 6/19/22.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    static let comicId = 123
    
    @ObservedObject var comicViewModel = ComicViewModel(comicId: comicId)
    
    var body: some View {
        let comic = comicViewModel.comicResponse?.data.results.first
        
        AsyncImage(url: comicViewModel.comicImageUrl())
        .padding()
        
        Text(comic?.title ?? "Missing title")
        .padding()
        
        Text(comic?.description ?? "Missing desc")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
