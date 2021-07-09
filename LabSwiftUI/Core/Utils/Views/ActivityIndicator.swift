//
//  ActivityIndicator.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(
        context: Context
    ) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: Context
    ) {
        uiView.startAnimating()
    }
}
