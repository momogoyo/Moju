//
//  NewsDetailView.swift
//
//
//  Created by 현유진 on 10/4/25.
//

import SwiftUI
import WebKit

// MARK: - NewsDetailView
public struct NewsDetailView: View {
  let article: Article
  
  public var body: some View {
    if let url = URL(string: article.url) {
      WebView(url: url)
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
    } else {
      VStack {
        Text("Invalid URL")
      }
      .toolbar(.hidden, for: .tabBar)
    }
  }
}

// MARK: - WebView
struct WebView: UIViewRepresentable {
  let url: URL
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.load(URLRequest(url: url))
    
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {}
}
