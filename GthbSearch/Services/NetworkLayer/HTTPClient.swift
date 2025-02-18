//
//  HTTPClient.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    @discardableResult
    func get(from request: URLRequest, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
