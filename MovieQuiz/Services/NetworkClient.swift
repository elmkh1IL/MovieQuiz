//
//  NetworkClient.swift
//  MovieQuiz
//
//  Created by xxx on 24.01.2026.
//

import Foundation

struct NetworkClient {
    
    private enum NetworkError: Error {
        case codeError
    }
    
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let result: Result<Data, Error>
            
            if let error = error {
                result = .failure(error)
            } else if let response = response as? HTTPURLResponse,
        response.statusCode < 200 || response.statusCode >= 300 {
                result = .failure(NetworkError.codeError)
            } else if let data = data {
                result = .success(data)
            } else {
                result = .failure(NetworkError.codeError)
            }
            
            DispatchQueue.main.async {
                handler(result)
            }
            
            }
        task.resume()
            
        }
    }
