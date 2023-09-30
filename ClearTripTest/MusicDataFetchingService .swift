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

protocol MusicDataFetching {
    func fetchMusicData() throws -> Data
}

class ListFetcher: ListFetching {

    let serviceProvider: LocalMusicDataFetcher
    
    init(serviceProvider: LocalMusicDataFetcher) {
        self.serviceProvider = serviceProvider
    }
    
    func getMusicList() throws -> [MusicInfo] {
        let data = try serviceProvider.fetchMusicData()
        return [MusicInfo]()
    }
}

class LocalMusicDataFetcher : ListFetching {
    
    let parser = Parser()
    
    func getMusicList() throws -> [MusicInfo] {
        let data = try fetchMusicData()
        let musicList = try parser.parse(of: MusicInfo.self, form: data)
        return musicList
    }
    
    
    func fetchMusicData() throws -> Data {
        let path = Bundle().path(forResource: "DummyData", ofType: ".json")
        guard let path = path, let pathUrl = URL(string: path)  else {
            throw MusicListError.noMusicNotFound
        }
        let data = try Data(contentsOf: pathUrl)
        
        return data
    }

}

class Parser {
    
    func parse<T: Codable>(of type: T.Type, form data: Data) throws -> [T] {
        let json = try JSONDecoder().decode([T].self, from: data)
        return json
    }
    
}

enum MusicListError: Error {
    case noMusicNotFound
}
