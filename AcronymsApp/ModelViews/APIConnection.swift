//
//  Data.swift
//  AcronymsApp
//
//  Created by Arvey Rodríguez on 10/9/21.
//

import Foundation
import Alamofire

class APIConnection: ObservableObject {
    
    private let apiUrl = "http://www.nactem.ac.uk/software/acromine/dictionary.py"
    
    @Published var acronym = Acronym()
    
    
    func searchAcronyms(sf: String) {
        
        if (sf == "") {
            self.acronym = Acronym()
            return
        }
        
        DispatchQueue.main.async {
            AF.request(self.apiUrl, parameters: ["sf": sf]).responseJSON { (response) in
                
                switch response.result {
                case .success:
                    
                    var result = [Acronym]()
                    do {
                        
                        result = try JSONDecoder().decode([Acronym].self, from: response.data!)
                        
                        if (result.count > 0) {
                            self.acronym = result[0]
                        }
                        else {
                            self.acronym = Acronym()
                        }
                        
                    }
                    catch {
                        self.acronym = Acronym()
                        print("Failed to convert: \(error.localizedDescription)")
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                    break
                }
                
            }
        }
    }
    
    
    
}
