//
//  Injection.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

final class Injection: NSObject {
    
    private func provideRepository() -> MealRepositoryProtocol {
        let remote: HomeRemoteDataSource = HomeRemoteDataSource.sharedInstance
        
        return MealRepository.sharedInstance(remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeIntector(repository: repository)
    }
}
