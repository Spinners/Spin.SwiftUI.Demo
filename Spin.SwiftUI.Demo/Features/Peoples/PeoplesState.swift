//
//  FilmsState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

extension PeoplesFeature {
    enum State {
        case idle
        case loading(page: Int? = nil)
        case loaded(data: [ViewItem], previousPage: Int?, nextPage: Int?)
        case failed

        struct ViewItem: Identifiable {
            let people: People
            let isFavorite: Bool

            var id: String {
                self.people.url
            }

            static let empty = ViewItem(people: .empty,
                                        isFavorite: false)
        }
    }
}

extension PeoplesFeature.State {
    var isLoading: Bool {
        if case .loading(_) = self {
            return true
        }

        return false
    }

    var isFailed: Bool {
        if case .failed = self {
            return true
        }

        return false
    }

    var peoples: [PeoplesFeature.State.ViewItem] {
        if case .loaded(let data, _, _) = self {
            return data
        }

        return []
    }

    var hasPreviousPage: Bool {
        if case .loaded(_, let previous, _) = self, previous != nil {
            return true
        }

        return false
    }

    var hasNextPage: Bool {
        if case .loaded(_, _, let next) = self, next != nil {
            return true
        }

        return false
    }
}
