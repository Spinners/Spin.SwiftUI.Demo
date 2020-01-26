//
//  PlanetsRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-04.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct PlanetsRowView: View {

    let planet: Planet
    let isFavorite: Bool

    var body: some View {
        HStack {
            if isFavorite {
                Image(systemName: "star.fill")
            }
            Text(planet.name)
            Spacer()
        }
    }
}

struct PlanetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsRowView(planet: .empty, isFavorite: true)
    }
}
