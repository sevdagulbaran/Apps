//
//  ViewController.swift
//  HeroApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource{
    
    var heroes: [Hero] = []
    
    @IBOutlet weak var heroCollectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
    
     
        heroCollectionView.dataSource = self
     
        fetchData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = heroCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.setHero(hero: heroes[indexPath.row])

        return cell
        
    }
    func fetchData(){
        HeroService.shared.fetchHeros() { response in
            DispatchQueue.main.async {
                self.heroes.append(contentsOf: response)
                    self.heroCollectionView.reloadData()
            }
        }
    }
    
}
