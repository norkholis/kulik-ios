//
//  MealRepository.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

protocol MealRepositoryProtocol {
    
    func getCategories(
        result: @escaping (Result<[CategoryModel], Error>) -> Void
    )
}

final class MealRepository: NSObject {
    
    typealias MealInstance = (HomeRemoteDataSource) -> MealRepository
    
    fileprivate let remote: HomeRemoteDataSource
    
    private init(remote: HomeRemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: MealInstance = { remoteRepo in
        return MealRepository(remote: remoteRepo)
    }
}

extension MealRepository: MealRepositoryProtocol {
    func getCategories(
        result: @escaping (Result<[CategoryModel], Error>) -> Void
    ) {
        self.remote.getCategories { remoteResponse in
            switch remoteResponse {
            case .success(let categoryResponse):
                let resultList = CategoryMapper.mapCategoryResponseToDomains(input: categoryResponse)
                result(.success(resultList))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
