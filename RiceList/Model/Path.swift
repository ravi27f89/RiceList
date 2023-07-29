//
//  Path.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import Foundation

/// A RawRepresentable specialized for Request path
/// Because we can't use typealias we use a protocol
public protocol Path: RawRepresentable where RawValue == String {

}
