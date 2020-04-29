//
//  AppView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-01.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SpinCombine
import SpinReactiveSwift
import SpinRxSwift
import SwiftUI

struct AppView: View {

    @EnvironmentObject
    var viewBuilder: ViewBuilder

    var body: some View {
        TabView {
            viewBuilder
                .makeReactiveSwiftTrendingView()
                .tabItem {
                    Image(systemName: "speedometer")
                    Text("Trending (ReactiveSwift)")
            }

            viewBuilder
                .makeCombineTrendingView()
                .tabItem {
                    Image(systemName: "speedometer")
                    Text("Trending (Combine)")
            }

            viewBuilder
                .makeReactiveSwiftTrendingView()
                .tabItem {
                    Image(systemName: "speedometer")
                    Text("Trending (RxSwift)")
            }
        }
    }
}

import Swinject

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
