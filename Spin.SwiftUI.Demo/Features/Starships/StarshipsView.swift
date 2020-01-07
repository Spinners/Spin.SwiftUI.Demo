//
//  StarshipsView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import SwiftUI

struct StarshipsView: View {
    @ObservedObject
    var context: CombineViewContext<StarshipsFeature.State, StarshipsFeature.Action>

    var disposeBag = [AnyCancellable]()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // STARSHIPS LIST
                    List(self.context.state.starships) { viewItem in
                        NavigationLink(destination: StarshipView()) {
                            StarshipsRowView(starshipViewItem: viewItem)
                        }
                    }
                    .disabled(self.context.state.isLoading)
                    .opacity(self.context.state.isLoading ? 0.0: 1.0)
                    .frame(height: UIScreen.main.bounds.height / 2)

                    // PREVIOUS AND NEXT BUTTONS
                    VStack {
                        HStack {
                            Button(action: {
                                self.context.send(mutation: .loadPrevious)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Previous")
                                    Spacer()
                                }                    }
                                .disabled(!self.context.state.hasPreviousPage)

                            Button(action: {
                                self.context.send(mutation: .loadNext)
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
                ActivityIndicatorView(isLoading: self.context.state.isLoading)
            }
            .navigationBarTitle("Starships")

        }
        .onAppear {
            self.context.send(mutation: .load)
        }
    }
}

struct StarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsView(context: CombineViewContext(state: .idle))
    }
}
