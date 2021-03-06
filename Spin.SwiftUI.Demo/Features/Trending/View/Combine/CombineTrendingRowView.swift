//
//  PlanetsRowView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-04.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI

struct CombineTrendingRowView: View {
    
    let title: String
    let isFavorite: Bool
    
    var body: some View {
        HStack {
            if isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
            }
            Text(title)
            Spacer()
        }
    }
}

struct CombineTrendingRowView_Previews: PreviewProvider {
    static var previews: some View {
        CombineTrendingRowView(title: "preview_title",
                               isFavorite: true)
    }
}
