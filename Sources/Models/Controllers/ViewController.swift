//
//  ViewController.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

// MARK: - ViewControllerProtocol

public protocol ViewControllerProtocol: IBIdentifiable, IBCustomClassable, IBUserLabelable, IBConnectionOwner {
    var elementClass: String { get }
    var storyboardIdentifier: String? { get }
    var sceneMemberID: String? { get }
    var layoutGuides: [ViewControllerLayoutGuide]? { get }
    var userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]? { get }
    var connections: [AnyConnection]? { get }
    var keyCommands: [KeyCommand]? { get }
    var tabBarItem: TabBarItem? { get }
    var rootView: ViewProtocol? { get }
    var size: [Size]? { get }
    var framework: String { get }
    var automaticallyAdjustsScrollViewInsets: Bool? { get }
    var hidesBottomBarWhenPushed: Bool? { get }
    var autoresizesArchivedViewToFullSize: Bool? { get }
    var wantsFullScreenLayout: Bool? { get }
    var extendedLayoutIncludesOpaqueBars: Bool? { get }
}

extension ViewControllerProtocol {
    public var freeformSize: Size? { with(key: "freeformSize") }
    public var framework: String { "UIKit" }
}

public struct ViewController: IBDecodable, ViewControllerProtocol {
    public let id: String
    public let elementClass: String = "UIViewController"
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public var storyboardIdentifier: String?
    public let restorationIdentifier: String?
    public let useStoryboardIdentifierAsRestorationIdentifier: Bool?
    public let keyboardType: String?
    public let title: String?
    public let interactionActivityTrackingBaseName: String?
    public var automaticallyAdjustsScrollViewInsets: Bool?
    public var hidesBottomBarWhenPushed: Bool?
    public let autoresizesArchivedViewToFullSize: Bool?
    public let wantsFullScreenLayout: Bool?
    public let extendedLayoutIncludesOpaqueBars: Bool?
    public let modalTransitionStyle: ModalTransitionStyle?
    public let modalPresentationStyle: ModalPresentationStyle?
    public let definesPresentationContext: Bool?
    public let providesPresentationContextTransitionStyle: Bool?
    public var sceneMemberID: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let layoutGuides: [ViewControllerLayoutGuide]?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let keyCommands: [KeyCommand]?
    public let tabBarItem: TabBarItem?
    public let view: View?
    public var rootView: ViewProtocol? { return view }
    public let size: [Size]?

    enum LayoutGuidesCodingKeys: CodingKey { case viewControllerLayoutGuide }

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let container = xml.container(keys: CodingKeys.self)
        let layoutGuidesContainer = container.nestedContainerIfPresent(of: .layoutGuides, keys: LayoutGuidesCodingKeys.self)
        return .init(
            id: try container.attribute(of: .id),
            customClass: container.attributeIfPresent(of: .customClass),
            customModule: container.attributeIfPresent(of: .customModule),
            customModuleProvider: container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier: container.attributeIfPresent(of: .restorationIdentifier),
            useStoryboardIdentifierAsRestorationIdentifier: container.attributeIfPresent(of: .useStoryboardIdentifierAsRestorationIdentifier),
            keyboardType: container.attributeIfPresent(of: .keyboardType),
            title: container.attributeIfPresent(of: .title),
            interactionActivityTrackingBaseName: container.attributeIfPresent(of: .interactionActivityTrackingBaseName),
            autoresizesArchivedViewToFullSize: container.attributeIfPresent(of: .autoresizesArchivedViewToFullSize),
            wantsFullScreenLayout: container.attributeIfPresent(of: .wantsFullScreenLayout),
            extendedLayoutIncludesOpaqueBars: container.attributeIfPresent(of: .extendedLayoutIncludesOpaqueBars),
            modalTransitionStyle: container.attributeIfPresent(of: .modalTransitionStyle) ?? .coverVertical,
            modalPresentationStyle: container.attributeIfPresent(of: .modalPresentationStyle) ?? .automatic,
            definesPresentationContext: container.attributeIfPresent(of: .definesPresentationContext),
            providesPresentationContextTransitionStyle: container.attributeIfPresent(of: .providesPresentationContextTransitionStyle),
            userLabel: container.attributeIfPresent(of: .userLabel),
            colorLabel: container.attributeIfPresent(of: .colorLabel),
            layoutGuides: layoutGuidesContainer?.elementsIfPresent(of: .viewControllerLayoutGuide),
            userDefinedRuntimeAttributes: container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            connections: container.childrenIfPresent(of: .connections),
            keyCommands: container.childrenIfPresent(of: .keyCommands),
            tabBarItem: container.elementIfPresent(of: .tabBarItem),
            view: container.elementIfPresent(of: .view),
            size: container.elementsIfPresent(of: .size),
        )
    }
}
