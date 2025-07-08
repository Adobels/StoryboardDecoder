//
//  Segue.swift
//  IBDecodable
//
//  Created by phimage on 05/04/2018.
//

import SWXMLHash

public struct Segue: IBDecodable, ConnectionProtocol {
    public let id: String
    public let destination: String
    public let kind: Segue.Kind
    public let relationship: String?
    public let identifier: String?
    public let destinationCreationSelector: String?
    public let modalPresentationStyle: ModalPresentationStyle?
    public let modalTransitionStyle: ModalTransitionStyle?

    static func decode(_ xml: XMLIndexerType) throws -> Segue {
        let container = xml.container(keys: CodingKeys.self)
        return Segue(
            id: try container.attribute(of: .id),
            destination: try container.attribute(of: .destination),
            kind: try container.attribute(of: .kind),
            relationship: container.attributeIfPresent(of: .relationship),
            identifier: container.attributeIfPresent(of: .identifier),
            destinationCreationSelector: container.attributeIfPresent(of: .destinationCreationSelector),
            modalPresentationStyle: container.attributeIfPresent(of: .modalPresentationStyle),
            modalTransitionStyle: container.attributeIfPresent(of: .modalTransitionStyle)
        )
    }

    public enum Kind: XMLAttributeDecodable, KeyDecodable, Equatable {
        case relationship, show, showDetail, presentation, embed, unwind, push
        case modal, popover, replace, custom(String)

        public func encode(to encoder: Encoder) throws { fatalError() }

        static func decode(_ attribute: XMLAttribute) throws -> Segue.Kind {
            switch attribute.text {
            case "relationship": .relationship
            case "show": .show
            case "showDetail": .showDetail
            case "presentation": .presentation
            case "embed": .embed
            case "unwind": .unwind
            case "push": .push
            case "modal": .modal
            case "popover": .popover
            case "replace": .replace
            default: .custom(attribute.text)
            }
        }

        public static func == (left: Kind, right: Kind) -> Bool {
            switch (left, right) {
            case (.relationship, .relationship): true
            case (.show, .show): true
            case (.showDetail, .showDetail): true
            case (.presentation, .presentation): true
            case (.embed, .embed): true
            case (.unwind, .unwind): true
            case (.push, .push): true
            case (.modal, modal): true
            case (.popover, .popover): true
            case (.replace, .replace): true
            case (.custom(let left), .custom(let right)): left == right
            default: false
            }
        }
    }
}
