//
//  ArticleImageView.swift
//
//
//  Created by 현유진 on 10/6/25.
//

import SwiftUI

// MARK: - ArticleImageView
struct ArticleImageView: View {
  let imageUrl: URL
  private let imageHeight: CGFloat = 200
  
  var body: some View {
    AsyncImage(url: imageUrl) { phase in
      content(for: phase)
        .frame(maxWidth: .infinity, minHeight: imageHeight, maxHeight: imageHeight)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .clipped()
    }
  }
  
  @ViewBuilder
  private func content(for phase: AsyncImagePhase) -> some View {
    switch phase {
    case .empty:
      ProgressView()
      
    case .success(let image):
      image
        .resizable()
        .scaledToFill()
      
    case .failure:
      VStack(spacing: 6) {
        Image(systemName: "photo")
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50)
          .foregroundColor(.secondary.opacity(0.5))
        
        Text("Can't load image")
          .font(.caption)
          .foregroundColor(.secondary)
      }
      
    @unknown default:
      EmptyView()
    }
  }
}
