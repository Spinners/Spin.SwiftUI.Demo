//
//  PlanetState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension PlanetFeature {
    enum State {
        case loading(planet: Planet)
        case loaded(viewItem: ViewItem)
        case enablingFavorite(planet: Planet, favorite: Bool)
        case failed

        struct ViewItem {
            let planet: Planet
            let isFavorite: Bool

            static let empty = ViewItem(planet: .empty,
                                        isFavorite: false)
        }
    }
}

extension PlanetFeature.State {

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

    var planet: Planet {
        switch self {
        case .enablingFavorite(let planet, _):
            return planet
        case .loaded(let viewItem):
            return viewItem.planet
        default:
            return .empty
        }
    }
}
