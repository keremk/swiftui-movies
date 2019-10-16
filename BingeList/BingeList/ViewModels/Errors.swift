//
//  Errors.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/15/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Foundation

struct DataError: Error {
    enum ErrorKind {
        case invalidDate
        case invalidLanguage
        case invalidPath
    }

    let kind: ErrorKind
    let description: String
}
