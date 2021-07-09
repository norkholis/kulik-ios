//
//  HomeView.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Text("loading...")
                    ActivityIndicator()
                }
            } else {
                ScrollView(
                    .vertical,
                    showsIndicators: false
                ) {
                    ForEach(self.presenter.categories, id: \.id) { category in
                        ZStack {
                            self.presenter.linkBuilder(for: category, content: {
                                CategoryRow(category: category)
                            })
                            .buttonStyle(PlainButtonStyle())
                        }.padding(8)
                    }
                }
            }
        }.onAppear {
            if self.presenter.categories.count == 0 {
                self.presenter.getCategories()
            }
        }.navigationBarTitle(
            Text("Meals App"),
            displayMode: .automatic
        )
    }
}
