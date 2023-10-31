//
//  HTMLStringView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 31/10/2023.
//

import Foundation
import SwiftUI
import WebKit

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
