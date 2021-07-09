//
//  HomeInteractor.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

protocol HomeUseCase {
    
    func getCategories(completion: @escaping (Result<[CategoryModel], Error>) -> Void)
    
}

class HomeIntector: HomeUseCase {
    
    private let repository: MealRepositoryProtocol
    
    required init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    
    func getCategories(
        completion: @escaping (Result<[CategoryModel], Error>) -> Void
    ) {
        repository.getCategories(result: { result in
            completion(result)
        })
    }
}
