//
//  IBError.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

public enum IBError: Swift.Error, CustomStringConvertible {
    case elementNotFound
    case unsupportedViewClass(String)
    case unsupportedViewControllerClass(String)
    case unsupportedConstraint(String)
    case unsupportedTableViewDataMode(String)
    case unsupportedColorSpace(String)
    case unsupportedFontDescription
    case unsupportedDependency
    case unsupportedGestureRecognizer(String)
    case unsupportedTextInputTraits

    public var description: String {
        switch self {
        case .elementNotFound: "element not found"
        case .unsupportedViewClass(let name): "unsupported view class '\(name)'"
        case .unsupportedViewControllerClass(let name): "unsupported viewController class '\(name)'"
        case .unsupportedConstraint(let body): "unsupported constraint type '\(body)'"
        case .unsupportedTableViewDataMode(let name): "unsupported dataMode '\(name)'"
        case .unsupportedColorSpace(let colorSpace): "unsupported color space '\(colorSpace)'"
        case .unsupportedFontDescription: "unsupported font description"
        case .unsupportedDependency: "unssupported dependency"
        case .unsupportedGestureRecognizer(let name): "unsupported gesture recognizer '\(name)'"
        case .unsupportedTextInputTraits: "unsupported text input traits"
        }
    }
}
