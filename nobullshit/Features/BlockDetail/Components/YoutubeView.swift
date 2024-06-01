//
//  YoutubeView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
