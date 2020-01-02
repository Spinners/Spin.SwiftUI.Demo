//
//  PeoplesView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct PeoplesView: View {

    @ObservedObject
    var store: Store<PeoplesFeature.State>

    var body: some View {
        switch self.store.value {
        case .idle:
            return renderIdleState()
        case .loading(let page):
            return renderLoadingState(page: page)
        case .loaded(let peoples, _, _):
            return renderLoadedState(peoples: peoples)
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

    private func renderLoadedState(peoples: [(People, Bool)]) -> Text {
        return Text(verbatim: "LOADED")
    }

    private func renderFailState() -> Text {
        return Text(verbatim: "FAIL")
    }
}

struct PeoplesView_Previews: PreviewProvider {
    static var previews: some View {
        PeoplesView(store: Store<PeoplesFeature.State>(value: .idle))
    }
}
