//
//  ViewController.swift
//  Pokedex
//
//  Created by jlev on 6/27/17.
//  Copyright © 2017 L3. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemonCollection = [Pokemon]()
    var musicPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        parsePokemonCSV()
        initAudio()
        
        
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "jiggypuff", ofType: "mp3")!
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokeman", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemonCollection.append(poke)
            }
            
            
            
        } catch let error as NSError {
            print("Error parsing CSV: \(error.debugDescription)")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // We don't want to load all the listings in the collection at once so we use dequeueResuableCell to only show the ones
        // visible on the screen, once they leave the screen they will be dequeued.
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke = pokemonCollection[indexPath.row]
            cell.configureCell(poke)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCollection.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 105, height: 105)
    }
    
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
}

