//
//  LazyView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-16.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct LazyView<Content: View>: View {

    private let builder: () -> Content

    init(_ builder: @autoclosure @escaping () -> Content) {
        self.builder = builder
    }

    var body: some View {
        builder()
    }
}
