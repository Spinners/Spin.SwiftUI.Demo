//
//  StarshipState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension StarshipFeature {
    enum State {
        case loading(starship: Starship)
        case loaded(viewItem: ViewItem)
        case enablingFavorite(starship: Starship, favorite: Bool)
        case failed

        struct ViewItem {
            let starship: Starship
            let isFavorite: Bool

            static let empty = ViewItem(starship: .empty,
                                        isFavorite: false)
        }
    }
}

extension StarshipFeature.State {

    var isEnablingFavorite: Bool {
        if case .enablingFavorite(_, _) = self {
            return true
        }

        return false
    }

    var isFavorite: Bool {
        if case .loaded(let viewItem) = self, viewItem.isFavorite == true {
            return true
        }

        return false
    }

    var starship: Starship {
        switch self {
        case .enablingFavorite(let starship, _):
            return starship
        case .loaded(let viewItem):
            return viewItem.starship
        default:
            return .empty
        }
    }
}
