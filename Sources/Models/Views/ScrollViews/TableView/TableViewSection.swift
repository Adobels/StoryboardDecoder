//
//  TableViewSection.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

public struct TableViewSection: IBDecodable {

    public let id: String
    public let headerTitle: String?
    public let footerTitle: String?
    public let colorLabel: String?
    public let cells: [AnyView]?
    public let userComments: AttributedString?

    enum ExternalCodingKeys: CodingKey { case attributedString }
    enum AttributedStringCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> TableViewSection {
        assert(xml.elementName == "tableViewSection")
        let container = xml.container(keys: CodingKeys.self)
        let attributedStringContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .attributedString, keys: AttributedStringCodingKeys.self)
        return TableViewSection(
            id: try container.attribute(of: .id),
            headerTitle: container.attributeIfPresent(of: .headerTitle),
            footerTitle: container.attributeIfPresent(of: .footerTitle),
            colorLabel: container.attributeIfPresent(of: .colorLabel),
            cells: container.childrenIfPresent(of: .cells),
            userComments: attributedStringContainer?.withAttributeElement(.key, "userComments")
        )
    }
}
