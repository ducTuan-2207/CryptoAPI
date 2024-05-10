//
//  NetwokingManager.swift
//  CryptoAPI
//
//  Created by macOS on 10/05/2024.
//

import Foundation
import Combine

class NetwokingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):return "[🫣] Bad response from URL: \(url)"
            case .unknown:return  "[👀]Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
     return  URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try
                handleURLResponse(output: $0, url: url)
                
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
        
    
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        // Xử lý hoàn thành của publisher
        switch completion {
        case .finished:
            // Nếu hoàn thành thành công, không có hành động cụ thể được thực hiện
            break
        case .failure(let error):
            // Nếu có lỗi, in ra mô tả lỗi
            print(error.localizedDescription)
        }
    }
}
