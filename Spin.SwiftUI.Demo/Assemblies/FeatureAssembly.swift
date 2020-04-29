//
//  FeatureAssembly.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import Dispatch
import ReactiveSwift
import RxSwift
import SpinCombine
import SpinReactiveSwift
import SpinRxSwift
import SwiftUI
import Swinject

final class FeatureAssembly: Assembly {
    func assemble(container: Container) {
        // Trending Scene
        // (ReactiveSwift impolementation)
        container.register(ReactiveSwiftTrendingView.self) { resolver in
            let trendingSpin = resolver.resolve(ReactiveSpin<Trending.State, Trending.Event>.self)!
            let trendingUISpin = ReactiveSwiftUISpin(spin: trendingSpin)
            let view = ReactiveSwiftTrendingView(uiSpin: trendingUISpin)
            trendingUISpin.start()
            return view
        }

        // Trending Scene
        // (Combine impolementation)
        container.register(CombineTrendingView.self) { resolver in
            let trendingSpin = resolver.resolve(CombineSpin<Trending.State, Trending.Event>.self)!
            let trendingUISpin = CombineSwiftUISpin(spin: trendingSpin)
            let view = CombineTrendingView(uiSpin: trendingUISpin)
            trendingUISpin.start()
            return view
        }

        // Trending Scene
        // (RxSwift impolementation)
        container.register(RxSwiftTrendingView.self) { resolver in
            let trendingSpin = resolver.resolve(RxSpin<Trending.State, Trending.Event>.self)!
            let trendingUISpin = RxSwiftUISpin(spin: trendingSpin)
            let view = RxSwiftTrendingView(uiSpin: trendingUISpin)
            trendingUISpin.start()
            return view
        }

        // Gif Scene
        // (ReactiveSwift implementation)
        container.register(ReactiveSwiftGifView.self) { (resolver, gifId: String) in
            let gifSpin = resolver.resolve(ReactiveSpin<Gif.State, Gif.Event>.self, argument: gifId)!
            let gifSpinUISpin = ReactiveSwiftUISpin(spin: gifSpin)
            let view = ReactiveSwiftGifView(uiSpin: gifSpinUISpin)
            gifSpinUISpin.start()
            return view
        }

        // Gif Scene
        // (Combine implementation)
        container.register(CombineGifView.self) { (resolver, gifId: String) in
            let gifSpin = resolver.resolve(CombineSpin<Gif.State, Gif.Event>.self, argument: gifId)!
            let gifSpinUISpin = CombineSwiftUISpin(spin: gifSpin)
            let view = CombineGifView(uiSpin: gifSpinUISpin)
            gifSpinUISpin.start()
            return view
        }

        // Gif Scene
        // (RxSwift implementation)
        container.register(RxSwiftGifView.self) { (resolver, gifId: String) in
            let gifSpin = resolver.resolve(RxSpin<Gif.State, Gif.Event>.self, argument: gifId)!
            let gifSpinUISpin = RxSwiftUISpin(spin: gifSpin)
            let view = RxSwiftGifView(uiSpin: gifSpinUISpin)
            gifSpinUISpin.start()
            return view
        }
    }
}
