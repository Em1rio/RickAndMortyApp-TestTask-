//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import Foundation
/// Primary API service object to get Rick and Morty data
final class APIManager {
    
    /// Shared singletone instance
    static let shared = APIManager()
    
    /// Privatized constructor
    private init(){}
    
    enum APIManagerError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick And Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - complition: Callback with data or error
    ///   - type: The type of object we expect to get back
    public func execute<T: Codable>(
        _ request: Request,
        expecting type: T.Type,
        complition: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            complition(.failure(APIManagerError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? APIManagerError.failedToGetData))
                return
            }
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                complition(.success(result))
            }
            catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from rmRequest: Request) -> URLRequest? {
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
