//
//  NewsListView.swift
//
//
//  Created by 현유진 on 10/5/25.
//

import SwiftUI

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
      }
      .navigationTitle("News")
      .task {
        await newsViewModel.loadHeadlines()
      }
    }
  }
}

private struct NewsCardView: View {
  private var article: Article
  
  fileprivate init(article: Article) {
    self.article = article
  }
  
  fileprivate var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      if let imageUrl = article.urlToImage {
        ZStack(alignment: .center) {
          AsyncImage(url: URL(string: imageUrl)) { image in
            switch image {
            case .success(let image):
              image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(6)
                .clipped()
            case .empty:
              ProgressView()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(6)
                .frame(height: 200)
                .clipped()
            case .failure(_):
              VStack {
                Image(systemName: "photo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 50, height: 50)
                  .foregroundColor(Color.gray.opacity(0.5))
                
                Text("Can't load image")
                  .font(.caption)
                  .foregroundColor(.secondary)
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(Color.gray.opacity(0.1))
              .cornerRadius(6)
              
            @unknown default:
              EmptyView()
            }
          }
          .frame(height: 200)
          .frame(maxWidth: .infinity, alignment: .center)
        }
      }
      
      Text(article.title)
        .font(.headline)
      
      if let desc = article.description {
        Text(desc)
          .font(.subheadline)
          .foregroundColor(.secondary)
          .lineLimit(2)
      }
    }
    .padding(.vertical, 4)
  }
}
