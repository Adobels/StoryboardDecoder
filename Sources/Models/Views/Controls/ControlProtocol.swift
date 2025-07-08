//
//  ControlProtocol.swift
//  
//
//  Created by phimage on 19/09/2020.
//

import Foundation

public protocol ControlProtocol {
    // MARK: Attributes Inspector
    var contentHorizontalAlignment: String? { get }
    var contentVerticalAlignment: String? { get }
    var showsMenuAsPrimaryAction: Bool? { get }
    var selected: Bool? { get }
    var enabled: Bool? { get }
    var highlighted: Bool? { get }
    var toolTip: String? { get }
}

struct Control: IBDecodable, ControlProtocol {

    let contentHorizontalAlignment: String?
    let contentVerticalAlignment: String?
    let showsMenuAsPrimaryAction: Bool?
    let selected: Bool?
    let enabled: Bool?
    let highlighted: Bool?
    let toolTip: String?

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let container = xml.container(keys: CodingKeys.self)
        return .init(
            contentHorizontalAlignment: container.attributeIfPresent(of: .contentHorizontalAlignment),
            contentVerticalAlignment: container.attributeIfPresent(of: .contentVerticalAlignment),
            showsMenuAsPrimaryAction: container.attributeIfPresent(of: .showsMenuAsPrimaryAction),
            selected: container.attributeIfPresent(of: .selected),
            enabled: container.attributeIfPresent(of: .enabled),
            highlighted: container.attributeIfPresent(of: .highlighted),
            toolTip: container.attributeIfPresent(of: .toolTip),
        )
    }
}
