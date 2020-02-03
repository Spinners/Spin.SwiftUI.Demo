//
//  StarshipsView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import Spin_Combine
import SwiftUI

struct StarshipsView: View {
    
    @ObservedObject
    var context: CombineViewContext<StarshipsFeature.State, StarshipsFeature.Event>

    @EnvironmentObject
    var viewBuilder: ViewBuilder

    var disposeBag = [AnyCancellable]()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // STARSHIPS LIST
                    List(self.context.state.starships) { viewItem in
                        NavigationLink(destination: self.viewBuilder.makeStarshipView(with: viewItem.starship)) {
                            StarshipsRowView(starship: viewItem.starship, isFavorite: viewItem.isFavorite)
                        }
                    }
                    .id(self.context.state.id) // hack to avoid list animation
                    .disabled(self.context.state.isLoading)
                    .opacity(self.context.state.isLoading ? 0.0: 1.0)
                    .frame(height: UIScreen.main.bounds.height / 2)

                    // PREVIOUS AND NEXT BUTTONS
                    VStack {
                        HStack {
                            Button(action: {
                                self.context.emit(.loadPrevious)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Previous")
                                    Spacer()
                                }                    }
                                .disabled(!self.context.state.hasPreviousPage)

                            Button(action: {
                                self.context.emit(.loadNext)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Next")
                                    Spacer()
                                }
                            }
                            .disabled(!self.context.state.hasNextPage)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .padding(0)
                ActivityIndicatorView(isLoading: self.context.state.isLoading, style: .large)
            }
            .navigationBarTitle("Starships")
            .onAppear {
                self.context.emit(.load)
            }
        }
    }
}

import Swinject

struct StarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsView(context: CombineViewContext(state: .idle))
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
