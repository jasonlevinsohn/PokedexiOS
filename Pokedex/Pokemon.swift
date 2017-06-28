//
//  Pokemon.swift
//  Pokedex
//
//  Created by jlev on 6/27/17.
//  Copyright © 2017 L3. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    // Need this to initialize each pokemon object
    init(name: String, pokedexId: Int) {
        self._pokedexId = pokedexId
        self._name = name
    }
}
