//
//  CastRaw.swift
//  cast
//
//  Created by Nathan Hamblen on 2016-12-09.
//  Copyright © 2016 Houzz. All rights reserved.
//

import Foundation

extension JSONDictionary {
    public func value<A: RawRepresentable>(for key: JSONKey) -> A? where A.RawValue: JSONValue  {
        if let raw: A.RawValue = value(for: key)  {
            return A(rawValue: raw)
        }
        return nil
    }

    public func value<A: RawRepresentable>(for key: JSONKey) -> [A]? where A.RawValue: JSONValue {
        if let rawArray: [A.RawValue] = value(for: key)  {
            return rawArray.flatMap { A(rawValue: $0) }
        }
        return nil
    }
}

extension RawRepresentable  {
    public var jsonValue: Any? {
        return self.rawValue
    }
}

extension Array where Element: RawRepresentable, Element.RawValue: JSONValue {
    public var jsonValue: Any? {
        return self.map { $0.jsonValue }
    }
}
