//
//  AnyViewController.swift
//  IBLinterCore
//
//  Created by Steven Deutsch on 3/11/18.
//

import SWXMLHash

// MARK: - AnyViewController

public struct AnyViewController: IBDecodable {

    public let viewController: ViewControllerProtocol

    init(_ viewController: ViewControllerProtocol) {
        self.viewController = viewController
    }

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ xml: XMLIndexerType) throws -> AnyViewController {
        guard let elementName = xml.elementName else {
            throw IBError.elementNotFound
        }
        return switch elementName {
        case "viewController": try AnyViewController(ViewController.decode(xml))
        case "tableViewController": try AnyViewController(TableViewController.decode(xml))
        case "collectionViewController": try AnyViewController(CollectionViewController.decode(xml))
        case "navigationController": try AnyViewController(NavigationController.decode(xml))
        case "tabBarController": try AnyViewController(TabBarController.decode(xml))
        case "pageViewController": try AnyViewController(PageViewController.decode(xml))
        case "splitViewController": try AnyViewController(SplitViewController.decode(xml))
        case "avPlayerViewController": try AnyViewController(AVPlayerViewController.decode(xml))
        case "glkViewController": try AnyViewController(GLKViewController.decode(xml))
        case "hostingController": try AnyViewController(HostingController.decode(xml))
        default: throw IBError.unsupportedViewControllerClass(elementName)
        }
    }
}

extension AnyViewController: IBAny {
    public typealias NestedElement = ViewControllerProtocol
    public var nested: ViewControllerProtocol {
        return viewController
    }
}

// MARK: - ViewControllerLayoutGuide

public struct ViewControllerLayoutGuide: IBDecodable, IBIdentifiable {
    public let id: String
    public let type: String

    static func decode(_ xml: XMLIndexerType) throws -> ViewControllerLayoutGuide {
        let container = xml.container(keys: CodingKeys.self)
        return try ViewControllerLayoutGuide(
            id: container.attribute(of: .id),
            type: container.attribute(of: .type)
        )
    }
}

// MARK: - ViewControllerPlaceholder

public struct ViewControllerPlaceholder: IBDecodable {
    public let id: String
    public let storyboardName: String
    public let referencedIdentifier: String?
    public let sceneMemberID: String?

    static func decode(_ xml: XMLIndexerType) throws -> ViewControllerPlaceholder {
        assert(xml.elementName == "viewControllerPlaceholder")
        let container = xml.container(keys: CodingKeys.self)
        return ViewControllerPlaceholder(
            id: try container.attribute(of: .id),
            storyboardName: try container.attribute(of: .storyboardName),
            referencedIdentifier: container.attributeIfPresent(of: .referencedIdentifier),
            sceneMemberID: container.attributeIfPresent(of: .sceneMemberID)
        )
    }
}
