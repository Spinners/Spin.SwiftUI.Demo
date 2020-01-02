//
//  StarshipsView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct StarshipsView: View {
    @ObservedObject
    var store: Store<StarshipsFeature.State>

    var body: some View {
        switch self.store.value {
        case .idle:
            return renderIdleState()
        case .loading(let page):
            return renderLoadingState(page: page)
        case .loaded(let starships, _, _):
            return renderLoadedState(starships: starships)
        case .failed:
            return renderFailState()
        }
    }

    private func renderIdleState() -> Text {
        return Text(verbatim: "IDLE")
    }

    private func renderLoadingState(page: Int?) -> Text {
        return Text(verbatim: "LOADING PAGE \(page ?? 0)")
    }

    private func renderLoadedState(starships: [(Starship, Bool)]) -> Text {
        return Text(verbatim: "LOADED")
    }

    private func renderFailState() -> Text {
        return Text(verbatim: "FAIL")
    }
}

struct StarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsView(store: Store<StarshipsFeature.State>(value: .idle))
    }
}
