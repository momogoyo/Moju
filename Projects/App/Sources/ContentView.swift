//
//  ContentView.swift
//  Moju
//
//  Created by 현유진 on 10/4/25.
//

import SwiftUI
import News

struct ContentView: View {
  var body: some View {
    TabView {
      NewsListView()
        .tabItem { Label("News", systemImage: "text.rectangle.page") }
      
      Text("Todo")
        .tabItem { Label("Weather", systemImage: "checkmark") }
      
      Text("Journal")
        .tabItem { Label("Todo", systemImage: "note.text") }
      
      Text("Bookmarks")
        .tabItem { Label("Memo", systemImage: "star") }
    }
  }
}

#Preview {
  ContentView()
}
