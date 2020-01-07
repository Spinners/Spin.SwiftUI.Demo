//
//  PlanetsRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-04.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct PlanetsRowView: View {

    let planetViewItem: PlanetsFeature.State.ViewItem

    var body: some View {
        HStack {
            if planetViewItem.isFavorite {
                Image(systemName: "star.fill")
            }
            Text(planetViewItem.title)
            Spacer()
        }
    }
}

struct PlanetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsRowView(planetViewItem: PlanetsFeature.State.ViewItem(title: "Dagoba", isFavorite: true))
    }
}
