//
//  HomeRemoteDataSource.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

protocol HomeRemoteDataSourceProtocol: class {
    
    func getCategories(
        result: @escaping (Result<[CategoryResponse], URLError>) -> Void
    )
}

final class HomeRemoteDataSource: NSObject {
    
    override init() {}
    
    static let sharedInstance: HomeRemoteDataSource = HomeRemoteDataSource()
}

extension HomeRemoteDataSource: HomeRemoteDataSourceProtocol {
    
    func getCategories(
        result: @escaping (Result<[CategoryResponse], URLError>) -> Void
    ) {
        guard let url = URL(string: Endpoints.Gets.categories.url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
            if maybeError != nil {
                result(.failure(.urlNotReachable(url)))
            } else if
                let data = maybeData,
                let response = maybeResponse as? HTTPURLResponse,
                response.statusCode == 200
            {
                let decoder = JSONDecoder()
                do {
                    let categories = try decoder.decode(CategoriesResponse.self, from: data).categories
                    result(.success(categories))
                } catch {
                    result(.failure(.invalidResponse))
                }
            }
        }
        task.resume()
    }
}
