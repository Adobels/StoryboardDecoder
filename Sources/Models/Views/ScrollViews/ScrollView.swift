//
//  ScrollView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol ScrollViewProtocol: ViewProtocol {
    // Attributes Inspector
    var indicatorStyle: IndicatorStyle? { get }
    var showsHorizontalScrollIndicator: Bool? { get }
    var showsVerticalScrollIndicator: Bool? { get }
    var scrollEnabled: Bool? { get }
    // UIScrollView Properties in Attributes Inspector
    var pagingEnabled: Bool? { get }
    var directionalLockEnabled: Bool? { get }
    var bounces: Bool? { get }
    var bouncesZoom: Bool? { get }
    var alwaysBounceHorizontal: Bool? { get }
    var alwaysBounceVertical: Bool? { get }
    var minimumZoomScale: Float? { get }
    var maximumZoomScale: Float? { get }
    var delaysContentTouches: Bool? { get }
    var canCancelContentTouches: Bool? { get }
    var keyboardDismissMode: String? { get } // Do not Dismiss -> not present, Dismiss on drag -> onDrag, Dismiss interactively -> interactive,
    // Size Inspector
    var scrollIndicatorInsets: Inset? { get }
    var contentInsetAdjustmentBehavior: String? { get }
    var contentLayoutGuide: LayoutGuide? { get }
    var frameLayoutGuide: LayoutGuide? { get }
}

public struct ScrollView: IBDecodable, ViewProtocol, ScrollViewProtocol, IBIdentifiable {    
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UIScrollView"
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
    public let misplaced: Bool?
    public let isAmbiguous: Bool?
    public let variations: [Variation]?
    public let subviews: [AnyView]?
    // MARK: UIScrollView
    public let indicatorStyle: IndicatorStyle?
    public let showsHorizontalScrollIndicator: Bool?
    public let showsVerticalScrollIndicator: Bool?
    public let scrollEnabled: Bool?
    public let pagingEnabled: Bool?
    public let directionalLockEnabled: Bool?
    public let bounces: Bool?
    public let bouncesZoom: Bool?
    public let alwaysBounceHorizontal: Bool?
    public let alwaysBounceVertical: Bool?
    public let minimumZoomScale: Float?
    public let maximumZoomScale: Float?
    public let delaysContentTouches: Bool?
    public let canCancelContentTouches: Bool?
    public let keyboardDismissMode: String?
    public let scrollIndicatorInsets: Inset?
    public let contentInsetAdjustmentBehavior: String?
    public let contentLayoutGuide: LayoutGuide?
    public let frameLayoutGuide: LayoutGuide?

    enum ConstraintsCodingKeys: CodingKey { case constraint }
    enum VariationCodingKey: CodingKey { case variation }
    enum ExternalCodingKeys: CodingKey { case color, viewLayoutGuide, keyboardLayoutGuide, inset }
    enum ColorsCodingKeys: CodingKey { case key }
    enum ViewLayoutCodingKeys: CodingKey { case key }
    enum InsetCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let view = try View.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let externalContainer = xml.container(keys: ExternalCodingKeys.self)
        let viewLayoutGuidesContainer = externalContainer
            .nestedContainerIfPresent(of: .viewLayoutGuide, keys: ViewLayoutCodingKeys.self)
        let insetContainer = externalContainer.nestedContainerIfPresent(of: .inset, keys: InsetCodingKeys.self)
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
            misplaced: view.misplaced,
            isAmbiguous: view.isAmbiguous,
            variations: view.variations,
            subviews: view.subviews,
            indicatorStyle: container.attributeIfPresent(of: .indicatorStyle),
            showsHorizontalScrollIndicator: container.attributeIfPresent(of: .showsHorizontalScrollIndicator),
            showsVerticalScrollIndicator: container.attributeIfPresent(of: .showsVerticalScrollIndicator),
            scrollEnabled: container.attributeIfPresent(of: .scrollEnabled),
            pagingEnabled: container.attributeIfPresent(of: .pagingEnabled),
            directionalLockEnabled: container.attributeIfPresent(of: .directionalLockEnabled),
            bounces: container.attributeIfPresent(of: .bounces),
            bouncesZoom: container.attributeIfPresent(of: .bouncesZoom),
            alwaysBounceHorizontal: container.attributeIfPresent(of: .alwaysBounceHorizontal),
            alwaysBounceVertical: container.attributeIfPresent(of: .alwaysBounceVertical),
            minimumZoomScale: container.attributeIfPresent(of: .minimumZoomScale),
            maximumZoomScale: container.attributeIfPresent(of: .maximumZoomScale),
            delaysContentTouches: container.attributeIfPresent(of: .delaysContentTouches),
            canCancelContentTouches: container.attributeIfPresent(of: .canCancelContentTouches),
            keyboardDismissMode: container.attributeIfPresent(of: .keyboardDismissMode),
            scrollIndicatorInsets: insetContainer?.withAttributeElement(.key, CodingKeys.scrollIndicatorInsets.stringValue),
            contentInsetAdjustmentBehavior: container.attributeIfPresent(of: .contentInsetAdjustmentBehavior),
            contentLayoutGuide: viewLayoutGuidesContainer?.withAttributeElement(.key, CodingKeys.contentLayoutGuide.stringValue),
            frameLayoutGuide: viewLayoutGuidesContainer?.withAttributeElement(.key, CodingKeys.frameLayoutGuide.stringValue),
        )
    }
}

public enum IndicatorStyle: XMLAttributeDecodable, Encodable, Equatable {
    case black
    case white
    case unknown(String)

    static func decode(_ attribute: XMLAttribute) throws -> Self {
        switch attribute.text {
        case "black": .black
        case "white": .white
        default: .unknown(attribute.text)
        }
    }
}
