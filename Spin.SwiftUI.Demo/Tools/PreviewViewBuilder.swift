//
//  PreviewViewBuilder.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-14.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SpinCombine
import SpinReactiveSwift
import SpinRxSwift

class PreviewViewBuilder: ViewBuilder {

    override func makeReactiveSwiftTrendingView() -> ReactiveSwiftTrendingView {
        return ReactiveSwiftTrendingView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .idle))
    }

    override func makeCombineTrendingView() -> CombineTrendingView {
        return CombineTrendingView(uiSpin: CombineSwiftUISpin.makeWith(initialState: .idle))
    }

    override func makeRxSwiftTrendingView() -> RxSwiftTrendingView {
        return RxSwiftTrendingView(uiSpin: RxSwiftUISpin.makeWith(initialState: .idle))
    }

    override func makeReactiveSwiftGifView(with gifId: String) -> LazyView<ReactiveSwiftGifView> {
        let content = ReactiveSwiftGifView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .loading(id: gifId)))
        return LazyView(content)
    }

    override func makeCombineGifView(with gifId: String) -> LazyView<CombineGifView> {
        let content = CombineGifView(uiSpin: CombineSwiftUISpin.makeWith(initialState: .loading(id: gifId)))
        return LazyView(content)
    }

        override func makeRxSwiftGifView(with gifId: String) -> LazyView<RxSwiftGifView> {
        let content = RxSwiftGifView(uiSpin: RxSwiftUISpin.makeWith(initialState: .loading(id: gifId)))
        return LazyView(content)
    }
}
