//
//  ReactiveSwiftGifView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-05.
//  Copyright © 2020 Spinners. All rights reserved.
//

import ReactiveSwift
import SpinReactiveSwift
import SwiftUI

struct ReactiveSwiftGifView: View {

    @ObservedObject
    var uiSpin: SwiftUISpin<Gif.State, Gif.Event>

    var body: some View {
        Form {
            LabelAndText(label: "Type", text: self.uiSpin.state.gif.type)
            LabelAndText(label: "Rating", text: self.uiSpin.state.gif.rating)
            LabelAndText(label: "User", text: self.uiSpin.state.gif.username)
            LabelAndToggle(label: "Favorite",
                           isSelected: self.uiSpin.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                           isLoading: self.uiSpin.state.isEnablingFavorite)
            PlayerView(url: self.uiSpin.state.gif.images.fixedHeightData.mp4, isPlaying: self.uiSpin.state.isLoaded)
                .frame(height: 200)
        }
        .navigationBarTitle("\(self.uiSpin.state.gif.title)", displayMode: .inline)
    }
}

struct ReactiveSwiftGifView_Previews: PreviewProvider {
    static var previews: some View {
        ReactiveSwiftGifView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .loading(id: "")))
    }
}
