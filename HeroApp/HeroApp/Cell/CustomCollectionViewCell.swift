//
//  CustomCollectionViewCell.swift
//  HeroApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import UIKit
import Kingfisher

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
   
      
    func setHero(hero: Hero) {
        titleLable.text = hero.localizedName
        let url = URL(string: "\(HeroService.constUrl)\(hero.img ?? "")")
        heroImage.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
    }
}
