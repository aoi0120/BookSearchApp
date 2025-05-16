//
//  APIClient.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import Foundation

class APIClient {
    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type) async -> T? {
        do {
            guard let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: encodedUrl) else {
                return nil
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return nil
            }
            
            let decodedData = try JSONDecoder().decode(responseType, from: data)
            return decodedData
        } catch {
            print("Faild to fetch data:", error)
            return nil
        }
                  
    }
}
