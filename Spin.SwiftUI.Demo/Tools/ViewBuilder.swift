//
//  ViewBuilder.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-14.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI
import Swinject

class ViewBuilder: ObservableObject {

    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func makeReactiveSwiftTrendingView() -> ReactiveSwiftTrendingView {
        let view = self.resolver.resolve(ReactiveSwiftTrendingView.self)!
        return view
    }

    func makeCombineTrendingView() -> CombineTrendingView {
        let view = self.resolver.resolve(CombineTrendingView.self)!
        return view
    }

    func makeRxSwiftTrendingView() -> RxSwiftTrendingView {
        let view = self.resolver.resolve(RxSwiftTrendingView.self)!
        return view
    }

    func makeReactiveSwiftGifView(with gifId: String) -> LazyView<ReactiveSwiftGifView> {
        let view = LazyView(self.resolver.resolve(ReactiveSwiftGifView.self, argument: gifId)!)
        return view
    }

    func makeCombineGifView(with gifId: String) -> LazyView<CombineGifView> {
        let view = LazyView(self.resolver.resolve(CombineGifView.self, argument: gifId)!)
        return view
    }

    func makeRxSwiftGifView(with gifId: String) -> LazyView<RxSwiftGifView> {
        let view = LazyView(self.resolver.resolve(RxSwiftGifView.self, argument: gifId)!)
        return view
    }
}
