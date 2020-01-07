//
//  StarshipsRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-06.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct StarshipsRowView: View {
    let starshipViewItem: StarshipsFeature.State.ViewItem

    var body: some View {
        HStack {
            if starshipViewItem.isFavorite {
                Image(systemName: "star.fill")
            }
            Text(starshipViewItem.title)
            Spacer()
        }
    }
}

struct StarshipsRowView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsRowView(starshipViewItem: StarshipsFeature.State.ViewItem(title: "Enterprise", isFavorite: true))
    }
}
