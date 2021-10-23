//
//  BeastsController.swift
//  HogwartsApp
//
//  Created by Daniel Washington Ignacio on 17/09/21.
//

import Foundation

protocol BeastsControllerProtocol: AnyObject {
    
    func success()
    func failed(error: Error)
}

class BeastsController {
    
    private var arrayBeasts: [Beasts] = []
    
    private weak var delegate: BeastsControllerProtocol?
    
    func count() -> Int {
        return self.arrayBeasts.count
    }
    
    func loadCurrentBeast(indexPath: IndexPath) -> Beasts {
        return self.arrayBeasts[indexPath.row]
    }
    
    func beastsName(indexPath: IndexPath) -> String {
        return self.arrayBeasts[indexPath.row].name ?? ""
    }
    
    func loadBeasts() {
        if let path = Bundle.main.path(forResource: "Beasts", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let _jsonResult = jsonResult as? Dictionary<String,AnyObject>, let beasts = _jsonResult["beasts"] as? [[String: Any]]{
                   
                    for value in beasts {
                        self.arrayBeasts.append(Beasts.init(dictionary: value))
                    }
                }
                delegate?.success()
            } catch {
                delegate?.failed(error: error)
            }
        }
    }
}
