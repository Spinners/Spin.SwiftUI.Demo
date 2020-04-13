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
                .makePlanetsView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Planets (Reactive)")
            }

            viewBuilder
                .makePeoplesView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Peoples (Rx)")
            }

            viewBuilder
                .makeStarshipsView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Starships (Combine)")
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
