//
//  GifState.swift
//  Spin.UIKit.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension Gif {
    enum State: Equatable {
        case loading(id: String)
        case enablingFavorite(gif: GifDetail, favorite: Bool)
        case loaded(gif: GifDetail, favorite: Bool)
        case failed
    }
}

extension Gif.State {
    var gif: GifDetail {
        switch self {
        case .enablingFavorite(let gif, _), .loaded(let gif, _):
            return gif
        default:
            return GifDetail(type: "", id: "", title: "", url: "", username: "", rating: "", images: Images(fixedHeightData: ImageData(url: "", mp4: "")))
        }
    }

    var isLoaded: Bool {
        if case .loaded = self {
            return true
        }

        return false
    }

    var isEnablingFavorite: Bool {
        if case .enablingFavorite(_, _) = self {
            return true
        }

        return false
    }

    var isFavorite: Bool {
        switch self {
        case .loaded(_, let isFavorite):
            return isFavorite
        default:
            return false
        }
    }
}
