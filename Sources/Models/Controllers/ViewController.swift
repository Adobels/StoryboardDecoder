//
//  ViewController.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

// MARK: - ViewControllerProtocol

public protocol ViewControllerProtocol: IBIdentifiable, IBCustomClassable, IBUserLabelable, IBConnectionOwner {
    var rootView: ViewProtocol? { get }
    var sceneMemberID: String? { get }
    var elementClass: String { get }
    var customClass: String? { get }
    var customModule: String? { get }
    var customModuleProvider: String? { get }
    var storyboardIdentifier: String?  { get }
    var restorationIdentifier: String? { get }
    var useStoryboardIdentifierAsRestorationIdentifier: Bool? { get }
    var userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]? { get }
    var userLabel: String? { get }
    var colorLabel: String? { get }
    var id: String { get }
    var keyboardType: String? { get }
    var title: String? { get }
    var interactionActivityTrackingBaseName: String? { get }
    var automaticallyAdjustsScrollViewInsets: Bool? { get }
    var hidesBottomBarWhenPushed: Bool? { get }
    var autoresizesArchivedViewToFullSize: Bool? { get }
    var wantsFullScreenLayout: Bool? { get }
    var extendedLayoutIncludesOpaqueBars: Bool? { get }
    var modalTransitionStyle: ModalTransitionStyle? { get }
    var modalPresentationStyle: ModalPresentationStyle? { get }
    var definesPresentationContext: Bool? { get }
    var providesPresentationContextTransitionStyle: Bool? { get }
    var tabBarItem: TabBarItem? { get }
    var keyCommands: [KeyCommand]? { get }
    var size: [Size]? { get }
    var layoutGuides: [ViewControllerLayoutGuide]? { get }
    var connections: [AnyConnection]? { get }
    var framework: String { get }
}

extension ViewControllerProtocol {
    public var freeformSize: Size? { with(key: "freeformSize") }
    public var framework: String { "UIKit" }
}

public struct ViewController: IBDecodable, ViewControllerProtocol {
    public let layoutGuides: [ViewControllerLayoutGuide]?
    public let view: View?
    public let tabBarItem: TabBarItem?
    public let connections: [AnyConnection]?
    public var rootView: ViewProtocol? { view }
    public let id: String
    public let elementClass: String = "UIViewController"
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let storyboardIdentifier: String?
    public let restorationIdentifier: String?
    public let useStoryboardIdentifierAsRestorationIdentifier: Bool?
    public let keyboardType: String?
    public let title: String?
    public let interactionActivityTrackingBaseName: String?
    public let automaticallyAdjustsScrollViewInsets: Bool?
    public let hidesBottomBarWhenPushed: Bool?
    public let autoresizesArchivedViewToFullSize: Bool?
    public let wantsFullScreenLayout: Bool?
    public let extendedLayoutIncludesOpaqueBars: Bool?
    public let modalTransitionStyle: ModalTransitionStyle?
    public let modalPresentationStyle: ModalPresentationStyle?
    public let definesPresentationContext: Bool?
    public let providesPresentationContextTransitionStyle: Bool?
    public let sceneMemberID: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let keyCommands: [KeyCommand]?
    public let size: [Size]?

    enum LayoutGuidesCodingKeys: CodingKey { case viewControllerLayoutGuide }

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let container = xml.container(keys: CodingKeys.self)
        let layoutGuidesContainer = container.nestedContainerIfPresent(of: .layoutGuides, keys: LayoutGuidesCodingKeys.self)
        return .init(
            layoutGuides: layoutGuidesContainer?.elementsIfPresent(of: .viewControllerLayoutGuide),
            view: container.elementIfPresent(of: .view),
            tabBarItem: container.elementIfPresent(of: .tabBarItem),
            connections: container.childrenIfPresent(of: .connections),
            id: try container.attribute(of: .id),
            customClass: container.attributeIfPresent(of: .customClass),
            customModule: container.attributeIfPresent(of: .customModule),
            customModuleProvider: container.attributeIfPresent(of: .customModuleProvider),
            storyboardIdentifier: container.attributeIfPresent(of: .storyboardIdentifier),
            restorationIdentifier: container.attributeIfPresent(of: .restorationIdentifier),
            useStoryboardIdentifierAsRestorationIdentifier: container.attributeIfPresent(of: .useStoryboardIdentifierAsRestorationIdentifier),
            keyboardType: container.attributeIfPresent(of: .keyboardType),
            title: container.attributeIfPresent(of: .title),
            interactionActivityTrackingBaseName: container.attributeIfPresent(of: .interactionActivityTrackingBaseName),
            automaticallyAdjustsScrollViewInsets: container.attributeIfPresent(of: .automaticallyAdjustsScrollViewInsets),
            hidesBottomBarWhenPushed: container.attributeIfPresent(of: .hidesBottomBarWhenPushed),
            autoresizesArchivedViewToFullSize: container.attributeIfPresent(of: .autoresizesArchivedViewToFullSize),
            wantsFullScreenLayout: container.attributeIfPresent(of: .wantsFullScreenLayout),
            extendedLayoutIncludesOpaqueBars: container.attributeIfPresent(of: .extendedLayoutIncludesOpaqueBars),
            modalTransitionStyle: container.attributeIfPresent(of: .modalTransitionStyle),
            modalPresentationStyle: container.attributeIfPresent(of: .modalPresentationStyle),
            definesPresentationContext: container.attributeIfPresent(of: .definesPresentationContext),
            providesPresentationContextTransitionStyle: container.attributeIfPresent(of: .providesPresentationContextTransitionStyle),
            sceneMemberID: container.attributeIfPresent(of: .sceneMemberID),
            userLabel: container.attributeIfPresent(of: .userLabel),
            colorLabel: container.attributeIfPresent(of: .colorLabel),
            userDefinedRuntimeAttributes: container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            keyCommands: container.childrenIfPresent(of: .keyCommands),
            size: container.elementsIfPresent(of: .size),
        )
    }
}
