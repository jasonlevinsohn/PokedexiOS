//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by jlev on 6/30/17.
//  Copyright © 2017 L3. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name

        
    }

   
}
