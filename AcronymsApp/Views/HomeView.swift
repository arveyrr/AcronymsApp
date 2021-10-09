//
//  ContentView.swift
//  AcronymsApp
//
//  Created by Arvey Rodríguez on 10/9/21.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 12) {
                
                SearchBar(placeHolder: "Search Acronym...", text: self.$searchText)
                RowView(searchText: self.searchText)
                
            }.padding()
            
        }.accentColor(Color(red: 0/255, green: 86/255, blue: 124/255))
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
