//
//  ActivityIndicatorView.swift
//  SwiftUIMovieDB
//
//  Created by Thibault Wittemberg on 2019-06-08.
//  Copyright © 2019 Thibault Wittemberg. All rights reserved.
//
import UIKit
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    var isLoading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.hidesWhenStopped = true
        indicator.style = .large
        return indicator
    }
    
    func updateUIView(_ view: UIActivityIndicatorView, context: Context) {
        if self.isLoading {
            view.startAnimating()
        } else {
            view.stopAnimating()
        }
    }
}

#if DEBUG
struct ActivityIndicatorView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ActivityIndicatorView(isLoading: true)
        }
        .previewLayout(.fixed(width: 50, height: 50))
    }
}
#endif
