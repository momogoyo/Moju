//
//  NewsResponse.swift
//
//
//  Created by 현유진 on 10/5/25.
//

import Foundation

struct NewsResponse: Codable {
  let status: String
  let totalResults: Int
  let articles: [Article]
}

