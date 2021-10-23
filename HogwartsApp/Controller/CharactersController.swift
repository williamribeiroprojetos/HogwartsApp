//
//  CharactersController.swift
//  HogwartsApp
//
//  Created by William Henrique Gonçalves Ribeiro on 23/09/21.
//

import Foundation
//import Alamofire

class CharactersController {
    
    private var arrayCharacters: [Character] = []
    
    func count() -> Int {
        return self.arrayCharacters.count
    }
    
    func namePersonagem(indexPath: IndexPath) -> String {
        return self.arrayCharacters[indexPath.row].name
    }
    
    func loadCurrentCharacter(indexPath: IndexPath) -> Character {
        return self.arrayCharacters[indexPath.row]
    }
    
    
//    func getPersonagem(completion: @escaping (Bool) -> Void) {
//        
//        guard let url = URL(string: "\(DefaultLinks.API_DOWNLOAD)")
//        else { return }
//        
//        AF.request(url, method: .get).validate(statusCode: 200..<300).responseJSON { response in
//            
//            switch response.result {
//                case .success:
//                    guard let jsonData = response.data else { return }
//                    let jsonDecoder = JSONDecoder()
//                    
//                    do {
//                        let result = try jsonDecoder.decode([Character].self, from: jsonData)
//                        print("Result: \(result)")
//                        
//                        self.arrayCharacters = result
//                        
//                        DispatchQueue.main.async {
//                            
//                            completion(true)
//                        }
//                        
//                    } catch let error {
//                        print("Error : \(error.localizedDescription)")
//                        completion(false)
//                    }
//                     
//                case .failure:
//                    print("Error")
//                completion(false)
//            }
//        }
//    }
    
}
