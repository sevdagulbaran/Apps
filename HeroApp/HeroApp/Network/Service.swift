//
//  Service.swift
//  HeroApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import Foundation
import Alamofire

class HeroService{
    var heros: [Hero] = []
    static let constUrl = "https://api.opendota.com"
    static let shared: HeroService = HeroService()
    
    private init(){
        
    }
    
    func fetchHeros(completionHandler: @escaping([Hero]) -> Void) {
        
        let url = HeroService.constUrl+"/api/heroStats"
        
        AF.request(url).response { response in
            guard let data = response.data else {
                print("Data could not fetched!")
                return
            }
            do {
                let heroResponse = try JSONDecoder().decode([Hero].self, from: data)
                completionHandler(heroResponse)
            } catch {
                print(error.localizedDescription)
            } 
        }
    }
}
