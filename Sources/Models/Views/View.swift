//
//  View.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

public struct View: IBDecodable, ViewProtocol, IBIdentifiable {
    public let key: String?
    // MARK: Identity Inspector
    public let id: String
    public let elementClass: String = "UIView"
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let userLabel: String?
    public let colorLabel: String?
    public let accessibility: Accessibility?
    // MARK: Attribut Inspector
    public let contentMode: String?
    public let semanticContentAttribute: String?
    public let tag: Int?
    public let userInteractionEnabled: Bool?
    public let multipleTouchEnabled: Bool?
    public let alpha: Float?
    public let backgroundColor: Color?
    public let tintColor: Color?
    public let opaque: Bool?
    public let hidden: Bool?
    public let clearsContextBeforeDrawing: Bool?
    public let clipsSubviews: Bool?
    public let autoresizesSubviews: Bool?
    // MARK: Size Inspector
    public let rect: Rect?
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let autoresizingMask: AutoresizingMask?
    public let directionalLayoutMargins: DirectionalEdgeInsets?
    public let layoutMargins: EdgeInset?
    public let preservesSuperviewLayoutMargins: Bool?
    public let layoutMarginsFollowReadableWidth: Bool?
    public let insetsLayoutMarginsFromSafeArea: Bool?
    public let viewLayoutGuide: LayoutGuide? // property specific to UIView in IB
    public let keyboardLayoutGuide: LayoutGuide? // propserty specific to UIView in IB
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let constraints: [Constraint]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let subviews: [AnyView]?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?

    //enum ConstraintsCodingKeys: CodingKey { case constraint }
    //enum VariationCodingKey: CodingKey { case variation }
    enum ViewElementKey: CodingKey {
        case color
        case constraint
        case directionalEdgeInsets
        case edgeInsets
        case inset
        case variation
        case viewLayoutGuide
        case rect
    }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> View {
        let container = xml.container(keys: CodingKeys.self)
        let viewElements = xml.container(keys: ViewElementKey.self)
        let constraintsContainer = container.nestedContainerIfPresent(of: .constraints, keys: ViewElementKey.self)
        let variationContainer = xml.container(keys: ViewElementKey.self)
        let colorsContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let rectContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .rect, keys: KeyCodingKeys.self)
        let directionalLayoutMarginsContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .directionalEdgeInsets, keys: KeyCodingKeys.self)
        let edgeInsetsContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .edgeInsets, keys: KeyCodingKeys.self)
        return View(
            key:                                       container.attributeIfPresent(of: .key),
            id:                                        try container.attribute(of: .id),
            customClass:                               container.attributeIfPresent(of: .customClass),
            customModule:                              container.attributeIfPresent(of: .customModule),
            customModuleProvider:                      container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier:                     container.attributeIfPresent(of: .restorationIdentifier),
            userDefinedRuntimeAttributes:              container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            userLabel:                                 container.attributeIfPresent(of: .userLabel),
            colorLabel:                                container.attributeIfPresent(of: .colorLabel),
            accessibility:                             container.elementIfPresent(of: .accessibility),
            contentMode:                               container.attributeIfPresent(of: .contentMode),
            semanticContentAttribute:                  container.attributeIfPresent(of: .semanticContentAttribute),
            tag:                                       container.attributeIfPresent(of: .tag),
            userInteractionEnabled:                    container.attributeIfPresent(of: .userInteractionEnabled),
            multipleTouchEnabled:                      container.attributeIfPresent(of: .multipleTouchEnabled),
            alpha:                                     container.attributeIfPresent(of: .alpha),
            backgroundColor:                           colorsContainer?.withAttributeElement(.key, CodingKeys.backgroundColor.stringValue),
            tintColor:                                 colorsContainer?.withAttributeElement(.key, CodingKeys.tintColor.stringValue),
            opaque:                                    container.attributeIfPresent(of: .opaque),
            hidden:                                    container.attributeIfPresent(of: .hidden),
            clearsContextBeforeDrawing:                container.attributeIfPresent(of: .clearsContextBeforeDrawing),
            clipsSubviews:                             container.attributeIfPresent(of: .clipsSubviews),
            autoresizesSubviews:                       container.attributeIfPresent(of: .autoresizesSubviews),
            rect:                                      rectContainer?.withAttributeElement(.key, "frame"),
            translatesAutoresizingMaskIntoConstraints: container.attributeIfPresent(of: .translatesAutoresizingMaskIntoConstraints),
            autoresizingMask:                          container.elementIfPresent(of: .autoresizingMask),
            directionalLayoutMargins:                  directionalLayoutMarginsContainer?.withAttributeElement(.key, CodingKeys.directionalLayoutMargins.stringValue),
            layoutMargins:                                edgeInsetsContainer?.withAttributeElement(.key, CodingKeys.layoutMargins.stringValue),
            preservesSuperviewLayoutMargins:           container.attributeIfPresent(of: .preservesSuperviewLayoutMargins),
            layoutMarginsFollowReadableWidth:          container.attributeIfPresent(of: .layoutMarginsFollowReadableWidth),
            insetsLayoutMarginsFromSafeArea:           container.attributeIfPresent(of: .insetsLayoutMarginsFromSafeArea),
            viewLayoutGuide:                           container.elementIfPresent(of: .viewLayoutGuide),
            keyboardLayoutGuide:                       container.elementIfPresent(of: .keyboardLayoutGuide),
            horizontalHuggingPriority:                 container.attributeIfPresent(of: .horizontalHuggingPriority),
            verticalHuggingPriority:                   container.attributeIfPresent(of: .verticalHuggingPriority),
            horizontalCompressionResistancePriority:   container.attributeIfPresent(of: .horizontalCompressionResistancePriority),
            verticalCompressionResistancePriority:     container.attributeIfPresent(of: .verticalCompressionResistancePriority),
            constraints:                               constraintsContainer?.elementsIfPresent(of: .constraint),
            connections:                               container.childrenIfPresent(of: .connections),
            variations:                                variationContainer.elementsIfPresent(of: .variation),
            subviews:                                  container.childrenIfPresent(of: .subviews),
            verifyAmbiguity:                           container.attributeIfPresent(of: .verifyAmbiguity),
            isMisplaced:                               container.attributeIfPresent(of: .isMisplaced),
            isAmbiguous:                               container.attributeIfPresent(of: .isAmbiguous),
        )
    }
}

// MARK: - LayoutGuide

public struct LayoutGuide: IBDecodable {
    public let key: String
    public let id: String

    static func decode(_ xml: XMLIndexerType) throws -> LayoutGuide {
        let container = xml.container(keys: CodingKeys.self)
        return try LayoutGuide(
            key: container.attribute(of: .key),
            id: container.attribute(of: .id)
        )
    }
}
