//
//  NewsService.swift
//
//
//  Created by 현유진 on 10/4/25.
//

import Foundation

final class NewsService {
  private let apiKey = "b51a8b6da799481d92e8deee38a36cb6"
  
  func fetchHeadlines() async throws -> [Article] {
    let urlString = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=\(apiKey)"
    guard let url = URL(string: urlString) else { return [] }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(NewsResponse.self, from: data)
    return decoded.articles
  }
}
