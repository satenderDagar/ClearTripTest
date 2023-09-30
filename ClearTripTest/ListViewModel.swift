import Foundation

class ListViewModel {
    
    let listfetcher: ListFetching
    var musicList = [MusicInfo]()
    
    
    init(listfetcher: ListFetching) {
        self.listfetcher = listfetcher
    }
    
    func fetchMusicList() {
        musicList = listfetcher.getMusicList()
    }
    
}


