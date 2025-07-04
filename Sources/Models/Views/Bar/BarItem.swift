//
//  BarItem.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

import SWXMLHash

protocol BarItemProtocol {
    var title: String? { get }
    var tag: Int? { get }
    var enabled: Bool? { get }
    // TODO: Add missing Attributes
}

public struct BarItem: IBDecodable, BarItemProtocol, IBIdentifiable {
    public let id: String
    public let title: String?
    public let tag: Int?
    public let enabled: Bool?

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let container = xml.container(keys: CodingKeys.self)
        return .init(
            id:         try container.attribute(of: .id),
            title:      container.attributeIfPresent(of: .title),
            tag:        container.attributeIfPresent(of: .tag),
            enabled:    container.attributeIfPresent(of: .enabled),
        )
    }
}
