//
//  StarshipsRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-06.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct StarshipsRowView: View {
    let starship: Starship
    let isFavorite: Bool

    var body: some View {
        HStack {
            if isFavorite {
                Image(systemName: "star.fill")
            }
            Text(starship.name)
            Spacer()
        }
    }
}

struct StarshipsRowView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsRowView(starship: .empty, isFavorite: true)
    }
}
