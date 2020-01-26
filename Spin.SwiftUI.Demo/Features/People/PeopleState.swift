//
//  PeopleState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension PeopleFeature {
    enum State {
        case loading(people: People)
        case loaded(viewItem: ViewItem)
        case enablingFavorite(people: People, favorite: Bool)
        case failed

        struct ViewItem {
            let people: People
            let isFavorite: Bool

            static let empty = ViewItem(people: .empty,
                                        isFavorite: false)
        }
    }
}

extension PeopleFeature.State {

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

    var people: People {
        switch self {
        case .enablingFavorite(let people, _):
            return people
        case .loaded(let viewItem):
            return viewItem.people
        default:
            return .empty
        }
    }
}

