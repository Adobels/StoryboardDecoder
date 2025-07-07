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
    public let layoutGuides: [ViewControllerLayoutGuide]?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let keyCommands: [KeyCommand]?
    public let tabBarItem: TabBarItem?
    public let tableView: TableView?
    public var rootView: ViewProtocol? { tableView }
    public let size: [Size]?
    public let automaticallyAdjustsScrollViewInsets: Bool?
    public let hidesBottomBarWhenPushed: Bool?
    public let autoresizesArchivedViewToFullSize: Bool?
    public let wantsFullScreenLayout: Bool?
    public let extendedLayoutIncludesOpaqueBars: Bool?
    // MARK: TableViewController
    public let clearsSelectionOnViewWillAppear: Bool?
    public var refreshControl: String? { nil }

    enum LayoutGuidesCodingKeys: CodingKey { case viewControllerLayoutGuide }

    static func decode(_ xml: XMLIndexerType) throws -> TableViewController {
        let container = xml.container(keys: CodingKeys.self)
        let layoutGuidesContainer = container.nestedContainerIfPresent(of: .layoutGuides, keys: LayoutGuidesCodingKeys.self)
        return TableViewController(
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
            tableView: container.elementIfPresent(of: .tableView),
            size: container.elementsIfPresent(of: .size),
            automaticallyAdjustsScrollViewInsets: container.attributeIfPresent(of: .automaticallyAdjustsScrollViewInsets),
            hidesBottomBarWhenPushed: container.attributeIfPresent(of: .hidesBottomBarWhenPushed),
            autoresizesArchivedViewToFullSize: container.attributeIfPresent(of: .autoresizesArchivedViewToFullSize),
            wantsFullScreenLayout: container.attributeIfPresent(of: .wantsFullScreenLayout),
            extendedLayoutIncludesOpaqueBars: container.attributeIfPresent(of: .extendedLayoutIncludesOpaqueBars),
            clearsSelectionOnViewWillAppear: container.attributeIfPresent(of: .clearsSelectionOnViewWillAppear),
        )
    }
}
