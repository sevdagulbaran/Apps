//
//  ViewController.swift
//  ColorsApp
//
//  Created by Sevda Gul Baran on 3.09.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegate{
    @IBOutlet weak var ColorCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // ColorCollectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ColorCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorCollectionViewCell
        cell.backgroundColor = createRondomColor()
        cell.colorLabel.text = "\(indexPath.row + 1)"
        
        return cell
        
        
    }
    
    func createRondomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        //print(CGFloat(drand48()))
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


