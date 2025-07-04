//
//  TabBarItem.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

import SWXMLHash

protocol TabBarItemProtocol: IBKeyable, IBCustomClassable, IBUserLabelable {
    var title: String? { get }
    var systemItem: String? { get }
    // TODO: Add missing Attributes
}

public struct TabBarItem: IBDecodable, TabBarItemProtocol {
    public let id: String
    public let key: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?
    // MARK: TabBarItem
    public let title: String?
    public let systemItem: String?

    static func decode(_ xml: XMLIndexerType) throws -> TabBarItem {
        let container = xml.container(keys: CodingKeys.self)
        return TabBarItem(
            id:                     try container.attribute(of: .id),
            key:                    container.attributeIfPresent(of: .key),
            customClass:            container.attributeIfPresent(of: .customClass),
            customModule:           container.attributeIfPresent(of: .customModule),
            customModuleProvider:   container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier:  container.attributeIfPresent(of: .restorationIdentifier),
            userLabel:              container.attributeIfPresent(of: .userLabel),
            colorLabel:             container.attributeIfPresent(of: .colorLabel),
            title:                  container.attributeIfPresent(of: .title),
            systemItem:             container.attributeIfPresent(of: .systemItem),
        )
    }
}
