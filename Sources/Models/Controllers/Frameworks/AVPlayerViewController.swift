//
//  AVPlayerViewController.swift
//  IBDecodable
//
//  Created by phimage on 04/04/2018.
//

import SWXMLHash

public struct AVPlayerViewController: IBDecodable, ViewControllerProtocol {

    public let elementClass: String = "AVPlayerViewController"
    public let id: String
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let storyboardIdentifier: String?
    public let sceneMemberID: String?
    public let layoutGuides: [ViewControllerLayoutGuide]?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let keyCommands: [KeyCommand]?
    public let tabBarItem: TabBarItem?
    public let view: AnyView?
    public var rootView: ViewProtocol? { view?.view }
    public let videoGravity: String?
    public let size: [Size]?
    public var framework: String { "AVKit" }
    public let automaticallyAdjustsScrollViewInsets: Bool?
    public let hidesBottomBarWhenPushed: Bool?
    public let autoresizesArchivedViewToFullSize: Bool?
    public let wantsFullScreenLayout: Bool?
    public let extendedLayoutIncludesOpaqueBars: Bool?

    enum LayoutGuidesCodingKeys: CodingKey { case viewControllerLayoutGuide }

    static func decode(_ xml: XMLIndexerType) throws -> AVPlayerViewController {
        let container = xml.container(keys: CodingKeys.self)
        let layoutGuidesContainer = container.nestedContainerIfPresent(of: .layoutGuides, keys: LayoutGuidesCodingKeys.self)
        return AVPlayerViewController(
            id: try container.attribute(of: .id),
            customClass: container.attributeIfPresent(of: .customClass),
            customModule: container.attributeIfPresent(of: .customModule),
            customModuleProvider: container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier: container.attributeIfPresent(of: .restorationIdentifier),
            userLabel: container.attributeIfPresent(of: .userLabel),
            colorLabel: container.attributeIfPresent(of: .colorLabel),
            storyboardIdentifier: container.attributeIfPresent(of: .storyboardIdentifier),
            sceneMemberID: container.attributeIfPresent(of: .sceneMemberID),
            layoutGuides: layoutGuidesContainer?.elementsIfPresent(of: .viewControllerLayoutGuide),
            userDefinedRuntimeAttributes: container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            connections: container.childrenIfPresent(of: .connections),
            keyCommands: container.childrenIfPresent(of: .keyCommands),
            tabBarItem: container.elementIfPresent(of: .tabBarItem),
            view: xml.childrenElements.first.flatMap(decodeValue),
            videoGravity: container.attributeIfPresent(of: .videoGravity),
            size: container.elementsIfPresent(of: .size),
            automaticallyAdjustsScrollViewInsets: container.attributeIfPresent(of: .automaticallyAdjustsScrollViewInsets),
            hidesBottomBarWhenPushed: container.attributeIfPresent(of: .hidesBottomBarWhenPushed),
            autoresizesArchivedViewToFullSize: container.attributeIfPresent(of: .autoresizesArchivedViewToFullSize),
            wantsFullScreenLayout: container.attributeIfPresent(of: .wantsFullScreenLayout),
            extendedLayoutIncludesOpaqueBars: container.attributeIfPresent(of: .extendedLayoutIncludesOpaqueBars),
        )
    }
}
