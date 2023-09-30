//
//  MusicDataModel.swift
//  ClearTripTest
//
//  Created by Satender Dagar on 30/09/23.
//

import Foundation

struct MusicInfo: Codable, Identifiable {
    var id: Int
    var songName: String
    var singer: String?
    var url: String?
}
