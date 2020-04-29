//
//  PlayerView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-04-28.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct PlayerView: UIViewRepresentable {

    var url: String
    var isPlaying: Bool

    func updateUIView(_ uiView: PlayerUIView, context: UIViewRepresentableContext<PlayerView>) {
        uiView.url = self.url
        if self.isPlaying {
            uiView.playFromBeginning()
        } else {
            uiView.stop()
        }
    }

    func makeUIView(context: Context) -> PlayerUIView {
        let playerUIView = PlayerUIView(frame: .zero)
        playerUIView.url = self.url
        return playerUIView
    }
}
