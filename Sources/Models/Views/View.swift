//
//  View.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

public protocol ViewProtocol: IBKeyable, IBCustomClassable, IBUserLabelable, IBConnectionOwner {
    var key: String? { get }
    //MARK: Identity Inspector
    var id: String { get }
    var elementClass: String { get }
    var customClass: String? { get }
    var customModule: String? { get }
    var customModuleProvider: String? { get }
    var restorationIdentifier: String? { get }
    var userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]? { get }
    var userLabel: String? { get }
    var colorLabel: String? { get }
    var accessibility: Accessibility? { get }
    //MARK: Attributes Inspector
    var contentMode: String? { get }
    var semanticContentAttribute: String? { get }
    var tag: Int? { get }
    // Attributes Inspector - Interaction
    var userInteractionEnabled: Bool? { get }
    var multipleTouchEnabled: Bool? { get }
    // Attributes Inspector -
    var alpha: Float? {get}
    var backgroundColor: Color? { get }
    var tintColor: Color? { get }
    // Attributes Inspector - Drawing
    var opaque: Bool? { get }
    var hidden: Bool? { get }
    var clearsContextBeforeDrawing: Bool? { get }
    var clipsSubviews: Bool? { get }
    var autoresizesSubviews: Bool? { get }
    //MARK: Size Inspector
    var rect: Rect? { get }
    var translatesAutoresizingMaskIntoConstraints: Bool? { get }
    var autoresizingMask: AutoresizingMask? { get }
    var directionalLayoutMargins: DirectionalEdgeInsets? { get }
    var layoutMargins: EdgeInset? { get }
    var preservesSuperviewLayoutMargins: Bool? { get }
    var layoutMarginsFollowReadableWidth: Bool? { get }
    var insetsLayoutMarginsFromSafeArea: Bool? { get }
    var safeArea: LayoutGuide? { get }
    var keyboard: LayoutGuide? { get }
    var constraints: [Constraint]? { get }
    var horizontalHuggingPriority: Int? { get }
    var verticalHuggingPriority: Int? { get }
    var horizontalCompressionResistancePriority: Int? { get }
    var verticalCompressionResistancePriority: Int? { get }
    var connections: [AnyConnection]? { get }
    var verifyAmbiguity: VerifyAmbiguity? { get }
    // MARK: IB Specific Attributes
    var misplaced: Bool? { get }
    var ambiguous: Bool? { get }
    var fixedFrame: Bool? { get }
    // MARK: Others
    var variations: [Variation]? { get }
    var subviews: [AnyView]? { get }
}

public struct View: IBDecodable, ViewProtocol, IBIdentifiable {
    // MARK: Identity Inspector
    public let id: String
    public let key: String?
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
    public let safeArea: LayoutGuide?
    public let keyboard: LayoutGuide?
    public let constraints: [Constraint]?
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let connections: [AnyConnection]?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let misplaced: Bool?
    public let ambiguous: Bool?
    public let fixedFrame: Bool?
    public let variations: [Variation]?
    public let subviews: [AnyView]?

    enum ViewElementKey: CodingKey {
        case color
        case constraint
        case directionalEdgeInsets
        case edgeInsets
        case inset
        case variation
        case viewLayoutGuide
        case keyboardLayoutGuide
        case rect
    }

    static func decode(_ xml: XMLIndexerType) throws -> View {
        let container = xml.container(keys: CodingKeys.self)
        let constraintsContainer = container.nestedContainerIfPresent(of: .constraints, keys: ViewElementKey.self)
        let variationContainer = xml.container(keys: ViewElementKey.self)
        let colorsContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let rectContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .rect, keys: KeyCodingKeys.self)
        let directionalLayoutMarginsContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .directionalEdgeInsets, keys: KeyCodingKeys.self)
        let edgeInsetsContainer = xml.container(keys: ViewElementKey.self).nestedContainerIfPresent(of: .edgeInsets, keys: KeyCodingKeys.self)
        let viewLayoutGuidesContainer = xml.container(keys: ViewElementKey.self)
            .nestedContainerIfPresent(of: .viewLayoutGuide, keys: KeyCodingKeys.self)
        let keyboardLayoutGuideContainer = xml.container(keys: ViewElementKey.self)
            .nestedContainerIfPresent(of: .keyboardLayoutGuide, keys: KeyCodingKeys.self)
        return View(
            id: try container.attribute(of: .id),
            key: container.attributeIfPresent(of: .key),
            customClass: container.attributeIfPresent(of: .customClass),
            customModule: container.attributeIfPresent(of: .customModule),
            customModuleProvider: container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier: container.attributeIfPresent(of: .restorationIdentifier),
            userDefinedRuntimeAttributes: container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            userLabel: container.attributeIfPresent(of: .userLabel),
            colorLabel: container.attributeIfPresent(of: .colorLabel),
            accessibility: container.elementIfPresent(of: .accessibility),
            contentMode: container.attributeIfPresent(of: .contentMode),
            semanticContentAttribute: container.attributeIfPresent(of: .semanticContentAttribute),
            tag: container.attributeIfPresent(of: .tag),
            userInteractionEnabled: container.attributeIfPresent(of: .userInteractionEnabled),
            multipleTouchEnabled: container.attributeIfPresent(of: .multipleTouchEnabled),
            alpha: container.attributeIfPresent(of: .alpha),
            backgroundColor: colorsContainer?.withAttributeElement(.key, CodingKeys.backgroundColor.stringValue),
            tintColor: colorsContainer?.withAttributeElement(.key, CodingKeys.tintColor.stringValue),
            opaque: container.attributeIfPresent(of: .opaque),
            hidden: container.attributeIfPresent(of: .hidden),
            clearsContextBeforeDrawing: container.attributeIfPresent(of: .clearsContextBeforeDrawing),
            clipsSubviews: container.attributeIfPresent(of: .clipsSubviews),
            autoresizesSubviews: container.attributeIfPresent(of: .autoresizesSubviews),
            rect: rectContainer?.withAttributeElement(.key, "frame"),
            translatesAutoresizingMaskIntoConstraints: container.attributeIfPresent(of: .translatesAutoresizingMaskIntoConstraints),
            autoresizingMask: container.elementIfPresent(of: .autoresizingMask),
            directionalLayoutMargins: directionalLayoutMarginsContainer?.withAttributeElement(.key, CodingKeys.directionalLayoutMargins.stringValue),
            layoutMargins: edgeInsetsContainer?.withAttributeElement(.key, CodingKeys.layoutMargins.stringValue),
            preservesSuperviewLayoutMargins: container.attributeIfPresent(of: .preservesSuperviewLayoutMargins),
            layoutMarginsFollowReadableWidth: container.attributeIfPresent(of: .layoutMarginsFollowReadableWidth),
            insetsLayoutMarginsFromSafeArea: container.attributeIfPresent(of: .insetsLayoutMarginsFromSafeArea),
            safeArea: viewLayoutGuidesContainer?.withAttributeElement(.key, CodingKeys.safeArea.stringValue),
            keyboard: keyboardLayoutGuideContainer?.withAttributeElement(.key, CodingKeys.keyboard.stringValue),
            constraints: constraintsContainer?.elementsIfPresent(of: .constraint),
            horizontalHuggingPriority: container.attributeIfPresent(of: .horizontalHuggingPriority),
            verticalHuggingPriority: container.attributeIfPresent(of: .verticalHuggingPriority),
            horizontalCompressionResistancePriority: container.attributeIfPresent(of: .horizontalCompressionResistancePriority),
            verticalCompressionResistancePriority: container.attributeIfPresent(of: .verticalCompressionResistancePriority),
            connections: container.childrenIfPresent(of: .connections),
            verifyAmbiguity: container.attributeIfPresent(of: .verifyAmbiguity),
            misplaced: container.attributeIfPresent(of: .misplaced),
            ambiguous: container.attributeIfPresent(of: .ambiguous),
            fixedFrame: container.attributeIfPresent(of: .fixedFrame),
            variations: variationContainer.elementsIfPresent(of: .variation),
            subviews: container.childrenIfPresent(of: .subviews),
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
