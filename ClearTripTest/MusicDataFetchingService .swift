//
//  MusicFetchingService .swift
//  ClearTripTest
//
//  Created by Satender Dagar on 30/09/23.
//

import Foundation

protocol ListFetching {
    func getMusicList() throws -> [MusicInfo]
}

class ListFetcher: ListFetching {

    let serviceProvider: MusicDataFetching
    
    init(serviceProvider: MusicDataFetching) {
        self.serviceProvider = serviceProvider
    }
    
    func getMusicList() throws -> [MusicInfo] {
        let data = try serviceProvider.getMusicList()
        return [MusicInfo]()
    }
}

enum MusicListError: Error {
    case noMusicNotFound
}
