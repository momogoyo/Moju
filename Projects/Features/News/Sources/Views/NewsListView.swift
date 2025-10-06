//
//  NewsListView.swift
//
//
//  Created by 현유진 on 10/5/25.
//

import SwiftUI

// MARK: - NewsListView
public struct NewsListView: View {
  @StateObject private var newsViewModel = NewsViewModel()
  
  public init() {}
  
  public var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 12) {
          ForEach(newsViewModel.articles) { article in
            NavigationLink {
              NewsDetailView(article: article)
            } label: {
              NewsCardView(article: article)
            }
            .buttonStyle(.plain)
          }
        }
        .padding()
      }
      .navigationTitle("News")
      .task {
        await newsViewModel.loadHeadlines()
      }
    }
  }
}
