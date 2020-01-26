//
//  PeoplesRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-05.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct PeoplesRowView: View {
    let people: People
    let isFavorite: Bool

    var body: some View {
        HStack {
            if isFavorite {
                Image(systemName: "star.fill")
            }
            Text(people.name)
            Spacer()
        }
    }
}

struct PeoplesRowView_Previews: PreviewProvider {
    static var previews: some View {
        PeoplesRowView(people: .empty, isFavorite: true)
    }
}
