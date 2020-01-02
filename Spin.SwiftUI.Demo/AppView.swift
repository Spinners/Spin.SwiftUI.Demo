//
//  AppView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-01.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            PlanetsView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Planets (Reactive)")
                }

            PeoplesView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Peoples (Rx)")
                }

            StarshipsView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Starships (Combine)")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
