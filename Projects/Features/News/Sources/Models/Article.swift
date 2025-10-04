//
//  Article.swift
//  
//
//  Created by 현유진 on 10/4/25.
//

import Foundation

struct Article: Codable {
  let source: Source
  let author: String
  let title: String
  let description: String
  let url: URL
  let urlToImage: URL
  let publishedAt: Date
  let content: String
}

struct Source {
  let id: String?
  let name: String
}
