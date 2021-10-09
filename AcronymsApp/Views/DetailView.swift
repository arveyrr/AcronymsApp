//
//  DetailView.swift
//  AcronymsApp
//
//  Created by Arvey Rodríguez on 10/9/21.
//

import SwiftUI

struct DetailView: View {
    
    let acronym: AcronymDetail
    
    
    var body: some View {
        VStack() {
           
            VStack(alignment: .center) {
                Text(self.acronym.lf)
                    .font(.title2).bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }.padding(.top)
            
            Divider()
            
            List(self.acronym.vars, id: \.self) { item in
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(item.lf)
                        .font(.title3).bold()
                    
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
                    }
                    
                }.padding(.bottom, 12)
                
            }//List
            .navigationBarTitle("Vars", displayMode: .inline)
            
        }.background(Color(red: 0/255, green: 86/255, blue: 124/255))
    }//body
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(acronym: AcronymDetail())
    }
}
