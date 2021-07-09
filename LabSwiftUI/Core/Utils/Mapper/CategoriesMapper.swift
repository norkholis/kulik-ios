//
//  CategoriesMapper.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

final class CategoryMapper {
    static func mapCategoryResponseToDomains(
        input categoryResponse: [CategoryResponse]
    ) -> [CategoryModel] {
        return categoryResponse.map { result in
            return CategoryModel(
                id: result.id ?? "",
                title: result.title ?? "Unknown",
                image: result.image ?? "Unknown",
                description: result.description ?? "Unknown"
            )
        }
    }
}
