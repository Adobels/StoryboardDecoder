//
//  ModalTransitionStyle.swift
//  IBDecodable
//
//  Created by eidd5180 on 11/10/2019.
//

import SWXMLHash

public enum ModalTransitionStyle: XMLAttributeDecodable, KeyDecodable, Equatable {
    case coverVertical, flipHorizontal, crossDissolve, partialCurl

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ attribute: XMLAttribute) throws -> ModalTransitionStyle {
        switch attribute.text {
        case "coverVertical": .coverVertical
        case "flipHorizontal": .flipHorizontal
        case "crossDissolve": .crossDissolve
        case "partialCurl": .partialCurl
        default: throw IBError.elementNotFound
        }
    }
}
