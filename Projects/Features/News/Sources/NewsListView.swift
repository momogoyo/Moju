//
//  NewsListView.swift
//
//
//  Created by 현유진 on 10/4/25.
//

import SwiftUI

public struct NewsListView: View {
  public init() {}
  
  public var body: some View {
    NavigationStack {
      List {
        Text("News Headline")
        Text("News Headline")
        Text("News Headline")
      }
      .listStyle(.plain)
      .navigationTitle("News")
    }
  }
}
