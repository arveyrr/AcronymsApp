//
//  Acronym.swift
//  AcronymsApp
//
//  Created by Arvey Rodríguez on 10/9/21.
//

import Foundation

public struct AcronymDetail: Codable, Hashable {
    
    public var lf = String()
    public var freq = Int()
    public var since = Int()
    public var vars = [AcronymVar]()
    
}
