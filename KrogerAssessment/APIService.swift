//
//  APIService.swift
//  KrogerAssessment
//
//  Created by Chetan Dhowlaghar on 7/15/24.
//

import Foundation
import Combine


struct APIService {
        // Typically makes an https call, but here we are replacing it with data in a local JSON file
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> Future<T, LocalServiceError> {
        return Future { promise in
            DispatchQueue.global(qos: .background).async {
                if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            promise(.success(decodedData))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            if let decodingError = error as? DecodingError {
                                promise(.failure(.decodingError(decodingError)))
                            } else {
                                promise(.failure(.dataLoadingError(error)))
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        promise(.failure(.fileNotFound))
                    }
                }
            }
        }
    }
}


// for APIs we could be calling it as APIError or APISericeError
enum LocalServiceError: Error {
    case fileNotFound
    case dataLoadingError(Error)
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .fileNotFound:
            return "File not found"
        case .dataLoadingError(let error):
            return "Data loading error: \(error.localizedDescription)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
}
