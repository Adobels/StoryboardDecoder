//
//  CollectionViewCell.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

import SWXMLHash
protocol CollectionViewCellProtocol {
    var reuseIdentifier: String? { get }
    var simulatedAppContext: String? { get }
    var contentView: CollectionViewCell.CollectionViewContentView { get }
}

public struct CollectionViewCell: IBDecodable, ViewProtocol, CollectionViewCellProtocol, IBIdentifiable, IBReusable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UICollectionViewCell"
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let userLabel: String?
    public let colorLabel: String?
    public let accessibility: Accessibility?
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
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    public let variations: [Variation]?
    //public let subviews: [AnyView]?
    // MARK: CollectioViewCell
    public let contentView: CollectionViewContentView
    private let _subviews: [AnyView]?
    public var subviews: [AnyView]? {
        return (_subviews ?? []) + [AnyView(contentView)]
    }
    public let reuseIdentifier: String?
    public let simulatedAppContext: String?

    public var children: [IBElement] {
        // do not let default implementation which lead to duplicate element contentView
        var children: [IBElement] = [contentView] + (rect.map { [$0] } ?? [])
        if let elements = constraints {
            children += elements as [IBElement]
        }
        if let elements = _subviews {
            children += elements as [IBElement]
        }
        if let elements = userDefinedRuntimeAttributes {
            children += elements as [IBElement]
        }
        if let elements = connections {
            children += elements as [IBElement]
        }
        return children
    }

    enum ConstraintsCodingKeys: CodingKey { case constraint }
    enum VariationCodingKey: CodingKey { case variation }
    enum ExternalCodingKeys: CodingKey { case color }
    enum ColorsCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let view = try View.decode(xml)
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case ._subviews: return "subview"
                case .contentView:
                    if xml.childrenElements.contains(where: {$0.elementName == "collectionViewCellContentView"}) {
                        return "collectionViewCellContentView"
                    }
                    return "view"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        return .init(
            id: view.id,
            key: view.key,
            customClass: view.customClass,
            customModule: view.customModule,
            customModuleProvider: view.customModuleProvider,
            restorationIdentifier: view.restorationIdentifier,
            userDefinedRuntimeAttributes: view.userDefinedRuntimeAttributes,
            userLabel: view.userLabel,
            colorLabel: view.colorLabel,
            accessibility: view.accessibility,
            contentMode: view.contentMode,
            semanticContentAttribute: view.semanticContentAttribute,
            tag: view.tag,
            userInteractionEnabled: view.userInteractionEnabled,
            multipleTouchEnabled: view.multipleTouchEnabled,
            alpha: view.alpha,
            backgroundColor: view.backgroundColor,
            tintColor: view.tintColor,
            opaque: view.opaque,
            hidden: view.hidden,
            clearsContextBeforeDrawing: view.clearsContextBeforeDrawing,
            clipsSubviews: view.clipsSubviews,
            autoresizesSubviews: view.autoresizesSubviews,
            rect: view.rect,
            translatesAutoresizingMaskIntoConstraints: view.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask: view.autoresizingMask,
            directionalLayoutMargins: view.directionalLayoutMargins,
            layoutMargins: view.layoutMargins,
            preservesSuperviewLayoutMargins: view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth: view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea: view.insetsLayoutMarginsFromSafeArea,
            safeArea: view.safeArea,
            keyboard: view.keyboard,
            constraints: view.constraints,
            horizontalHuggingPriority: view.horizontalHuggingPriority,
            verticalHuggingPriority: view.verticalHuggingPriority,
            horizontalCompressionResistancePriority: view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority: view.verticalCompressionResistancePriority,
            connections: view.connections,
            verifyAmbiguity: view.verifyAmbiguity,
            isMisplaced: view.isMisplaced,
            isAmbiguous: view.isAmbiguous,
            variations: view.variations,
            //subviews: view.subviews,
            contentView: try container.element(of: .contentView),
            _subviews: container.childrenIfPresent(of: ._subviews),
            reuseIdentifier: container.attributeIfPresent(of: .reuseIdentifier),
            simulatedAppContext: container.attributeIfPresent(of: .simulatedAppContext),
        )
    }
}

extension CollectionViewCell {

    public struct CollectionViewContentView: IBDecodable, ViewProtocol {
        // MARK: UIView
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
        public let isMisplaced: Bool?
        public let isAmbiguous: Bool?
        public let variations: [Variation]?
        public let subviews: [AnyView]?

        static func decode(_ xml: XMLIndexerType) throws -> Self {
            let view = try View.decode(xml)
            return .init(
                id: view.id,
                key: view.key,
                customClass: view.customClass,
                customModule: view.customModule,
                customModuleProvider: view.customModuleProvider,
                restorationIdentifier: view.restorationIdentifier,
                userDefinedRuntimeAttributes: view.userDefinedRuntimeAttributes,
                userLabel: view.userLabel,
                colorLabel: view.colorLabel,
                accessibility: view.accessibility,
                contentMode: view.contentMode,
                semanticContentAttribute: view.semanticContentAttribute,
                tag: view.tag,
                userInteractionEnabled: view.userInteractionEnabled,
                multipleTouchEnabled: view.multipleTouchEnabled,
                alpha: view.alpha,
                backgroundColor: view.backgroundColor,
                tintColor: view.tintColor,
                opaque: view.opaque,
                hidden: view.hidden,
                clearsContextBeforeDrawing: view.clearsContextBeforeDrawing,
                clipsSubviews: view.clipsSubviews,
                autoresizesSubviews: view.autoresizesSubviews,
                rect: view.rect,
                translatesAutoresizingMaskIntoConstraints: view.translatesAutoresizingMaskIntoConstraints,
                autoresizingMask: view.autoresizingMask,
                directionalLayoutMargins: view.directionalLayoutMargins,
                layoutMargins: view.layoutMargins,
                preservesSuperviewLayoutMargins: view.preservesSuperviewLayoutMargins,
                layoutMarginsFollowReadableWidth: view.layoutMarginsFollowReadableWidth,
                insetsLayoutMarginsFromSafeArea: view.insetsLayoutMarginsFromSafeArea,
                safeArea: view.safeArea,
                keyboard: view.keyboard,
                constraints: view.constraints,
                horizontalHuggingPriority: view.horizontalHuggingPriority,
                verticalHuggingPriority: view.verticalHuggingPriority,
                horizontalCompressionResistancePriority: view.horizontalCompressionResistancePriority,
                verticalCompressionResistancePriority: view.verticalCompressionResistancePriority,
                connections: view.connections,
                verifyAmbiguity: view.verifyAmbiguity,
                isMisplaced: view.isMisplaced,
                isAmbiguous: view.isAmbiguous,
                variations: view.variations,
                subviews: view.subviews,
            )
        }
    }
}
