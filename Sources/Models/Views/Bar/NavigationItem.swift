//
//  NavigationItem.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

import SWXMLHash

protocol NavigationItemProtocol: IBIdentifiable, IBKeyable, IBCustomClassable, IBUserLabelable {
    var title: String? { get }
    var style: String? { get }
    // TODO: Add missing attributes
}

public struct NavigationItem: IBDecodable, NavigationItemProtocol {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let userLabel: String?
    public let colorLabel: String?
    // MARK: NavigationItem
    public let title: String?
    public let style: String?

    static func decode(_ xml: XMLIndexerType) throws -> NavigationItem {
        let view = try View.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        return .init(
            id: view.id,
            key: view.key,
            customClass: view.customClass,
            customModule: view.customModule,
            customModuleProvider: view.customModuleProvider,
            restorationIdentifier: view.restorationIdentifier,
            userDefinedRuntimeAttributes: view.userDefinedRuntimeAttributes,
            userLabel: view.userLabel,
            colorLabel: view.colorLabel,
            title: container.attributeIfPresent(of: .title),
            style: container.attributeIfPresent(of: .style),
        )
    }
}
