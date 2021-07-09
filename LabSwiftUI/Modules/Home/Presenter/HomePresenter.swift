//
//  HomePresenter.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation
import SwiftUI

class HomePresenter: ObservableObject {
    
    private let homeUseCase: HomeUseCase
    
    @Published var categories: [CategoryModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getCategories() {
        loadingState = true
        homeUseCase.getCategories(completion: { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.loadingState = false
                    self.categories = categories
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.loadingState = false
                    self.errorMessage = error.localizedDescription
                }
            }
        })
    }
    
    func linkBuilder<Content: View>(
      for category: CategoryModel,
      @ViewBuilder content: () -> Content
    ) -> some View {
        content()
    }
}
