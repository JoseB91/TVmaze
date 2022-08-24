//
//  URLSession+Utils.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import Foundation

extension URLSession {
    func dataResponse<T: Codable>(for url: URL?,
                      success: @escaping (_ elements: [T]) -> Void,
                      failure: @escaping (_ error: Error?) -> Void) {
        
        guard let url = url else {
            failure(URLError(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {
                print(URLError(.badServerResponse))
                failure(error)
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                print("\(response)")
                failure(error)
                return
            }
            
            do {
                let elements = try JSONDecoder().decode([T].self, from: data)
                success(elements)
            } catch {
                print(error)
                failure(error)
            }
        }.resume()
    }
}
