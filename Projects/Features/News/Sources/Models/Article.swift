//
//  Article.swift
//
//
//  Created by 현유진 on 10/4/25.
//

import Foundation


struct Article: Codable, Identifiable {
  var id: String { url }
  let source: Source
  let author: String?
  let title: String
  let description: String?
  let url: String
  let urlToImage: String?
  let publishedAt: String?
  let content: String?
}

struct Source: Codable {
  let id: String?
  let name: String
}
