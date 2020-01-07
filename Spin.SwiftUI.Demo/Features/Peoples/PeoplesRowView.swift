//
//  PeoplesRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-05.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct PeoplesRowView: View {
    let peopleViewItem: PeoplesFeature.State.ViewItem

    var body: some View {
        HStack {
            if peopleViewItem.isFavorite {
                Image(systemName: "star.fill")
            }
            Text(peopleViewItem.title)
            Spacer()
        }
    }
}

struct PeoplesRowView_Previews: PreviewProvider {
    static var previews: some View {
        PeoplesRowView(peopleViewItem: PeoplesFeature.State.ViewItem(title: "Dagoba", isFavorite: true))
    }
}
