//
//  Webservice.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import Foundation
import Alamofire

class WebService {
    
    private let baseURL = URL(string: "https://api.pandascore.co/csgo/matches")!
    private let token = "lizKB0SnLKAmxVndMwJGFtz1KBpzhSLX6Ggh4zuGfGqVlDGY8Dc"
    
    func getMatches(completion: @escaping (_ result: Result<[Match], Error>) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data, error == nil else { return }
            do {
                let matches = try JSONDecoder().decode([Match].self, from: dataResponse)
                completion(.success(matches))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
