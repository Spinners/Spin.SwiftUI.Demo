//
//  AppView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-01.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct AppView: View {

    let planetsView: PlanetsView
    let peoplesView: PeoplesView
    let starshipsView: StarshipsView

    var body: some View {
        TabView {
            planetsView
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Planets (Reactive)")
            }

            peoplesView
                .tabItem {
                    Image(systemName: "person")
                    Text("Peoples (Rx)")
            }

            starshipsView
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Starships (Combine)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(planetsView: PlanetsView(context: ReactiveViewContext(state: .idle)),
                peoplesView: PeoplesView(context: RxViewContext(state: .idle)),
                starshipsView: StarshipsView(context: CombineViewContext(state: .idle)))
    }
}
