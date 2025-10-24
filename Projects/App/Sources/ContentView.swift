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
      NewsListView()
        .tabItem {
          Label("News", systemImage: "text.rectangle.page")
        }
      
      TodoListView()
        .tabItem {
          Label("Todo", systemImage: "checkmark")
        }
        .transition(.slide)
      
      Text("Journal")
        .tabItem {
          Label("Journal", systemImage: "note.text")
        }
      
      Text("Bookmarks")
        .tabItem {
          Label("Bookmarks", systemImage: "star")
        }
    }}

}

#Preview {
  ContentView()
}
