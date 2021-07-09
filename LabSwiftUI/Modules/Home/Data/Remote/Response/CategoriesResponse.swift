//
//  CategoriesResponse.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

struct CategoriesResponse: Decodable {
    let categories: [CategoryResponse]
}

struct CategoryResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case title = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    let id: String?
    let title: String?
    let image: String?
    let description: String?
}
