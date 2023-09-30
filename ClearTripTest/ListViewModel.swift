import Foundation

class ListViewModel {
    
    private let listfetcher: ListFetching
    var musicList = Bindable<[MusicInfo]>()
    
    init(listfetcher: ListFetching = ListFetcher(serviceProvider: LocalMusicDataFetcher())) {
        self.listfetcher = listfetcher
    }
    
    func fetchMusicList() throws {
        let musicList = try listfetcher.getMusicList()
        self.musicList = Bindable(value: musicList)
    }
}
