//
//  LabelAndText.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-13.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct LabelAndText: View {

    let label: String
    let text: String

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            Text(text)
        }
        .padding()
    }
}

struct LabelAndText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LabelAndText(label: "Model", text: "XWing")
                .colorScheme(.light)
            LabelAndText(label: "Model", text: "XWing")
                .colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
