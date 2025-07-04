//
//  BarButtonItem.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

import SWXMLHash

protocol BarButtonItemProtocol {
    var style: String? { get }
    var systemItem: String? { get }
    // TODO: Add missing Attributes
}

public struct BarButtonItem: IBDecodable, BarItemProtocol, BarButtonItemProtocol, IBIdentifiable, IBCustomClassable, IBUserLabelable {
    // MARK: BarItem
    public let id: String
    public let title: String?
    public let tag: Int?
    public let enabled: Bool?
    // MARK: BarButtonItem
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let style: String?
    public let systemItem: String?

    static func decode(_ xml: XMLIndexerType) throws -> BarButtonItem {
        let barItem = try BarItem.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        return BarButtonItem(
            id:                     barItem.id,
            title:                  barItem.title,
            tag:                    barItem.tag,
            enabled:                barItem.enabled,
            customClass:            container.attributeIfPresent(of: .customClass),
            customModule:           container.attributeIfPresent(of: .customModule),
            customModuleProvider:   container.attributeIfPresent(of: .customModuleProvider),
            userLabel:              container.attributeIfPresent(of: .userLabel),
            colorLabel:             container.attributeIfPresent(of: .colorLabel),
            style:                  container.attributeIfPresent(of: .style),
            systemItem:             container.attributeIfPresent(of: .systemItem),
        )
    }
}
