//
//  Store.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine

class Store<Value>: ObservableObject {
    @Published
    var value: Value

    init(value: Value) {
        self.value = value
    }
}
