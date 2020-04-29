//
//  PlanetsView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import SpinCombine
import SwiftUI

struct CombineTrendingView: View {

    @ObservedObject
    var uiSpin: SwiftUISpin<Trending.State, Trending.Event>

    @EnvironmentObject
    var viewBuilder: ViewBuilder

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // GIF LIST
                    List(self.uiSpin.state.viewItems) { viewItem in
                        NavigationLink(destination: self.viewBuilder.makeCombineGifView(with: viewItem.id)) {
                            CombineTrendingRowView(title: viewItem.title, isFavorite: viewItem.isFavorite)
                        }
                    }
                    .id(self.uiSpin.state.id) // hack to avoid list animation
                    .disabled(self.uiSpin.state.isLoading)
                    .opacity(self.uiSpin.state.isLoading ? 0.0: 1.0)
                    .frame(height: UIScreen.main.bounds.height / 2)

                    // PREVIOUS AND NEXT BUTTONS
                    VStack {
                        Spacer()

                        HStack {
                            Button(action: {
                                self.uiSpin.emit(.loadPrevious)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Previous")
                                    Spacer()
                                }
                            }
                            .disabled(!self.uiSpin.state.hasPreviousPage)

                            Button(action: {
                                self.uiSpin.emit(.loadNext)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Next")
                                    Spacer()
                                }
                            }
                            .disabled(!self.uiSpin.state.hasNextPage)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .padding(0)
                ActivityIndicatorView(isLoading: self.uiSpin.state.isLoading, style: .large)
            }
            .navigationBarTitle("Trending")
            .onAppear {
                self.uiSpin.emit(.load)
            }
        }
    }
}

import Swinject

struct CombineTrendingView_Previews: PreviewProvider {
    static var previews: some View {
        CombineTrendingView(uiSpin: CombineSwiftUISpin.makeWith(initialState: .idle))
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
