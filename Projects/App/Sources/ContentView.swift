//
//  ContentView.swift
//  Moju
//
//  Created by 현유진 on 10/4/25.
//

import SwiftUI
import News
import Todo

struct ContentView: View {
  var body: some View {
    TabView {
      Tab("News", systemImage: "text.rectangle.page") {
        NewsListView()
      }
      
      Tab("Todo", systemImage: "checkmark") {
        TodoListView()
      }
      
      Tab("Journal", systemImage: "note.text") {
//        JournalListView()
      }
      
      Tab("Bookmarks", systemImage: "star") {
//        BookmarksListView()
      }
    }
  }
}

#Preview {
  ContentView()
}
