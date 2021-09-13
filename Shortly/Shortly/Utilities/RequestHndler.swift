//
//  RequestHndler.swift
//  Shortly
//
//  Created by Nedim Basic on 3. 9. 2021..
//

import Foundation
import Alamofire

struct Response: Codable {
    let ok: Bool
    let result: ResponsePayload
}

struct ResponsePayload: Codable {
    let code: String
    let short_link: String
    let full_short_link: String
    let short_link2: String
    let full_short_link2: String
    let share_link: String
    let full_share_link: String
    let original_link: String
}

enum ShortError: Error {
    case invalidUrl
    case serverError
    case empty
}

class RequestHandler {
    private static let urlBase = "https://api.shrtco.de/v2/shorten?url="
    
    static func requestShortening(url: String, completed: @escaping (Result<String, ShortError>) -> Void) {
                
        
        if url == "" {
            completed(.failure(.empty))
            return
        }
        guard let url = URL(string: urlBase + url) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        
        let urlRrequest = URLRequest(url: url, timeoutInterval: TimeInterval(1000))
        AF.request(urlRrequest).responseJSON { response in
            
            guard let data = response.data else {
                completed(.failure(.serverError))
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(Response.self, from: data)
                
                if responseObject.ok {
                    completed(.success(responseObject.result.short_link))
                    return
                }
                completed(.failure(.serverError))
            }
            catch {
                completed(.failure(.serverError))
            }
        }
    }
}
