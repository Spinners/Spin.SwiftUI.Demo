//
//  LabelAndToggle.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-13.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct LabelAndToggle: View {

    let label: String

    @Binding
    var isSelected: Bool

    let isLoading: Bool

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            if !self.isLoading {
                Toggle(isOn: $isSelected) {
                    Text(label)
                }
                .labelsHidden()
                .frame(height: 25)
            }
            if self.isLoading {
                ActivityIndicatorView(isLoading: self.isLoading, style: .medium)
                    .frame(height: 25)
            }

        }
        .padding()
    }
}

struct LabelAndToggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LabelAndToggle(label: "Favorite", isSelected: .constant(true), isLoading: false)
            LabelAndToggle(label: "Favorite", isSelected: .constant(false), isLoading: true)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
