//
//  TrendingState.swift
//  Spin.UIKit.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

extension Trending {
    enum State {
        case idle
        case loading(page: Int = 0)
        case loaded(viewItems: [ViewItem], currentPage: Int, previousPage: Int, nextPage: Int, totalPage: Int)
        case failed
        
        struct ViewItem: Identifiable {
            let id: String
            let title: String
            let isFavorite: Bool
        }
    }
}

extension Trending.State {

    // hack to avoir list animations
    var id: String {
        switch self {
        case .loaded(let data, _, _, _, _):
            return data.map { $0.id }.joined()
        default:
            return ""
        }
    }

    var hasPreviousPage: Bool {
        switch self {
        case .loaded(_, _, let previousPage, let nextPage, _) where previousPage == 0 && nextPage == 1:
            return false
        default:
            return true
        }
    }

    var hasNextPage: Bool {
        switch self {
        case .loaded(_, _, _, let nextPage, let totalPage):
            return nextPage <= totalPage
        default:
            return false
        }
    }

    var viewItems: [Trending.State.ViewItem] {
        switch self {
        case .loaded(let viewItems, _, _, _, _):
            return viewItems
        default:
            return []
        }
    }

    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
}
