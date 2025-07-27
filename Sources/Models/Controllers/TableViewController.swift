//
//  TableViewController.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol TableViewControllerProtocol {
    var clearsSelectionOnViewWillAppear: Bool? { get }
    var refreshControl: String? { get }
}

public struct TableViewController: IBDecodable, ViewControllerProtocol, TableViewControllerProtocol {
    public let layoutGuides: [ViewControllerLayoutGuide]?
    public let tableView: TableView?
    public let tabBarItem: TabBarItem?
    public let connections: [AnyConnection]?
    public var rootView: ViewProtocol? { tableView }
    public let elementClass: String = "UITableViewController"
    public let id: String
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let storyboardIdentifier: String?
    public let sceneMemberID: String?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let keyCommands: [KeyCommand]?
    public let size: [Size]?
    public let automaticallyAdjustsScrollViewInsets: Bool?
    public let hidesBottomBarWhenPushed: Bool?
    public let autoresizesArchivedViewToFullSize: Bool?
    public let wantsFullScreenLayout: Bool?
    public let extendedLayoutIncludesOpaqueBars: Bool?
    public let useStoryboardIdentifierAsRestorationIdentifier: Bool?
    public let keyboardType: String?
    public let title: String?
    public let interactionActivityTrackingBaseName: String?
    public let modalTransitionStyle: ModalTransitionStyle?
    public let modalPresentationStyle: ModalPresentationStyle?
    public let definesPresentationContext: Bool?
    public let providesPresentationContextTransitionStyle: Bool?
    // MARK: TableViewController
    public let clearsSelectionOnViewWillAppear: Bool?
    // TODO: Add docoding
    public var refreshControl: String? { nil }

    enum LayoutGuidesCodingKeys: CodingKey { case viewControllerLayoutGuide }

    static func decode(_ xml: XMLIndexerType) throws -> TableViewController {
        let container = xml.container(keys: CodingKeys.self)
        let layoutGuidesContainer = container.nestedContainerIfPresent(of: .layoutGuides, keys: LayoutGuidesCodingKeys.self)
        return TableViewController(
            layoutGuides: layoutGuidesContainer?.elementsIfPresent(of: .viewControllerLayoutGuide),
            tableView: container.elementIfPresent(of: .tableView),
            tabBarItem: container.elementIfPresent(of: .tabBarItem),
            connections: container.childrenIfPresent(of: .connections),
            id: try container.attribute(of: .id),
            customClass: container.attributeIfPresent(of: .customClass),
            customModule: container.attributeIfPresent(of: .customModule),
            customModuleProvider: container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier: container.attributeIfPresent(of: .restorationIdentifier),
            userLabel: container.attributeIfPresent(of: .userLabel),
            colorLabel: container.attributeIfPresent(of: .colorLabel),
            storyboardIdentifier: container.attributeIfPresent(of: .storyboardIdentifier),
            sceneMemberID: container.attributeIfPresent(of: .sceneMemberID),
            userDefinedRuntimeAttributes: container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            keyCommands: container.childrenIfPresent(of: .keyCommands),
            size: container.elementsIfPresent(of: .size),
            automaticallyAdjustsScrollViewInsets: container.attributeIfPresent(of: .automaticallyAdjustsScrollViewInsets),
            hidesBottomBarWhenPushed: container.attributeIfPresent(of: .hidesBottomBarWhenPushed),
            autoresizesArchivedViewToFullSize: container.attributeIfPresent(of: .autoresizesArchivedViewToFullSize),
            wantsFullScreenLayout: container.attributeIfPresent(of: .wantsFullScreenLayout),
            extendedLayoutIncludesOpaqueBars: container.attributeIfPresent(of: .extendedLayoutIncludesOpaqueBars),
            useStoryboardIdentifierAsRestorationIdentifier: container.attributeIfPresent(of: .useStoryboardIdentifierAsRestorationIdentifier),
            keyboardType: container.attributeIfPresent(of: .keyboardType),
            title: container.attributeIfPresent(of: .title),
            interactionActivityTrackingBaseName: container.attributeIfPresent(of: .interactionActivityTrackingBaseName),
            modalTransitionStyle: container.attributeIfPresent(of: .modalTransitionStyle),
            modalPresentationStyle: container.attributeIfPresent(of: .modalPresentationStyle),
            definesPresentationContext: container.attributeIfPresent(of: .definesPresentationContext),
            providesPresentationContextTransitionStyle: container.attributeIfPresent(of: .providesPresentationContextTransitionStyle),
            clearsSelectionOnViewWillAppear: container.attributeIfPresent(of: .clearsSelectionOnViewWillAppear),
        )
    }
}
