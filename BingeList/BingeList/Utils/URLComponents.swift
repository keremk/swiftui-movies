//
//  URLComponents.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/6/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Foundation

extension URLComponents {
    func withScheme(scheme: String) -> URLComponents {
        var comps = self
        comps.scheme = scheme
        return comps
    }
    
    func withHost(host: String) -> URLComponents {
        var comps = self
        comps.host = host
        return comps
    }

    func withPort(port: Int) -> URLComponents {
        var comps = self
        comps.port = port
        return comps
    }
    
    func withPath(path: String) -> URLComponents {
        var comps = self
        comps.path = path
        return comps
    }
    
    func withQueryItems(queryItems: [URLQueryItem]) -> URLComponents {
        var comps = self
        comps.queryItems = queryItems
        return comps
    }

}
