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
    var isSelected: Bool? { get }
    var isEnabled: Bool? { get }
    var isHighlighted: Bool? { get }
    var toolTip: String? { get }
}

struct Control: IBDecodable, ControlProtocol {

    let contentHorizontalAlignment: String?
    let contentVerticalAlignment: String?
    let showsMenuAsPrimaryAction: Bool?
    let isSelected: Bool?
    let isEnabled: Bool?
    let isHighlighted: Bool?
    let toolTip: String?

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .isEnabled: return "enabled"
                case .isHighlighted: return "highlighted"
                case .isSelected: return "selected"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        return .init(
            contentHorizontalAlignment: container.attributeIfPresent(of: .contentHorizontalAlignment),
            contentVerticalAlignment: container.attributeIfPresent(of: .contentVerticalAlignment),
            showsMenuAsPrimaryAction: container.attributeIfPresent(of: .showsMenuAsPrimaryAction),
            isSelected: container.attributeIfPresent(of: .isSelected),
            isEnabled: container.attributeIfPresent(of: .isEnabled),
            isHighlighted: container.attributeIfPresent(of: .isHighlighted),
            toolTip: container.attributeIfPresent(of: .toolTip),
        )
    }
}
