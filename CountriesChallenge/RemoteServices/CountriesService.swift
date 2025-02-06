//
//  CountriesService.swift
//  CountriesChallenge
//

import Foundation

enum CountriesServiceError: Error {
    case failure(Error)
    case invalidUrl(String)
    case invalidData
    case decodingFailure
}

protocol CountriesServiceRequestDelegate: AnyObject {
    func didUpdate(error: Error?)
}

class CountriesService {
    public let urlString = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"

    private let countriesParser = CountriesParser()

    func fetchCountries() async throws -> [Country] {
        guard let url = URL(string: urlString) else {
            throw CountriesServiceError.invalidUrl(urlString)
        }

        return try await withUnsafeThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    return continuation.resume(throwing: CountriesServiceError.failure(error))
                }
                guard let data = data else {
                    return continuation.resume(throwing: CountriesServiceError.invalidData)
                }
                let result = self?.countriesParser.parser(data)
                switch result {
                    case .success(let countries):
                        let countries = countries ?? []
                        return continuation.resume(returning: countries)
                    case .failure(let error):
                        return continuation.resume(throwing: CountriesServiceError.failure(error))
                    case .none:
                        return continuation.resume(returning: [])
                }
            }
            task.resume()
        }
    }
}
