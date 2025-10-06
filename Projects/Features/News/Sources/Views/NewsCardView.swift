//
//  NewsCardView.swift
//
//
//  Created by 현유진 on 10/6/25.
//

import SwiftUI

// MARK: - NewsCardView
struct NewsCardView: View {
  let article: Article
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      if let imageUrl = article.urlToImage,
         let url = URL(string: imageUrl) {
        ArticleImageView(imageUrl: url)
      }
      
      VStack {
        ArticleHeaderView(title: article.title)
        
        if let desc = article.description {
          ArticleDescriptionView(description: desc)
        }
      }
      .padding(.vertical, 2)
      .padding(.horizontal, 4)
    }
    .padding(.vertical, 6)
  }
}

// MARK: - ArticleHeaderView
private struct ArticleHeaderView: View {
  let title: String
  
  var body: some View {
    Text(title)
      .font(.headline)
  }
}

// MARK: - ArticleDescriptionView
private struct ArticleDescriptionView: View {
  let description: String
  
  var body: some View {
    Text(description)
      .font(.subheadline)
      .foregroundColor(.secondary)
      .lineLimit(2)
  }
}
