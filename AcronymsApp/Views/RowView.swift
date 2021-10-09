//
//  RowView.swift
//  AcronymsApp
//
//  Created by Arvey Rodríguez on 10/9/21.
//

import SwiftUI

struct RowView: View {
    
    @ObservedObject var apiConnection = APIConnection()
    var searchText : String
    
    
    init (searchText: String) {
        self.searchText = searchText
        self.apiConnection.searchAcronyms(sf: searchText)
    }
    
    var body: some View {
        
        if (self.apiConnection.acronym.lfs.count == 0) {
            Text(self.searchText == "" ? "Make a search" : "Data not found")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.top, 60)
        }
        
        List(self.apiConnection.acronym.lfs.sorted(by: {$0.lf < $1.lf}), id: \.self) { item in
            NavigationLink(destination: DetailView(acronym: item)) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(item.lf)
                        .font(.title2).bold()
                        .foregroundColor(Color(red: 0/255, green: 86/255, blue: 124/255))
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Frequence:")
                            Text(String(item.freq))
                                .font(.subheadline).bold()
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Since:")
                            Text(String(item.since))
                                .font(.subheadline).bold()
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Vars:")
                            Text(String(item.vars.count))
                                .font(.subheadline).bold()
                                .foregroundColor(.gray)
                        }
                    }
                    
                }.padding(.bottom, 12)
                
                
            }//NavigationLink
            
            
        }.navigationBarTitle("Acronyms")
        .listStyle(PlainListStyle())
        
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(searchText: "")
    }
}
