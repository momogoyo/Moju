//
//  NewsViewModel.swift
//
//
//  Created by 현유진 on 10/4/25.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
  @Published var articles: [Article] = []
  private let service = NewsService()
  
  func loadHeadlines() async {
    do {
      articles = try await service.fetchHeadlines()
      print(articles)
    } catch {
      print("Error fetching news: \(error.localizedDescription)")
    }
  }
}
