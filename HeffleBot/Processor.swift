//
//  Processor.swift
//  HeffleBot
//
//  Created by Ben Schwartz on 3/18/22.
//

import Foundation
import CoreLocation



class JSON {
    
    struct DemoData: Codable {
        let title: String
        let description: String
    }
    
    
    var a: Int;
    func get_dog(_ i: Int) -> Int {
        return i + a;
    }
    
    init(_ i: Int) {
        a = i;
    }
}
extension JSON {
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
        
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        }
        catch {
            print(error)
        }
        return nil
    }
    
    private func parse(jsonData: Data) {
        
        
        do {
           // JSONDecoder.
            guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
              
                print("error")
                
              return
            }
            
            for course in json {
                print(course)
                
            }
            
            
            
            
//            let decodedData = try JSONDecoder().decode(DemoData.self, from: jsonData)
//
//            print("Title: ", decodedData.title)
//            print("Description: ", decodedData.description)
//            print("===================================")
        } catch {
            print("decode error")
        }
    }
    
    private func loadJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    public func load() {
        
        if let localData = self.readLocalFile(forName: "data") {
            self.parse(jsonData: localData)
        }
    }
    
    private func distance() {
        let coordinate₀ = CLLocation(latitude: 5.0, longitude: 5.0)
        let coordinate₁ = CLLocation(latitude: 5.0, longitude: 3.0)

        let distanceInMeters = coordinate₀.distance(from: coordinate₁) // result is in meters
    }
}
