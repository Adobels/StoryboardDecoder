//
//  ActivityIndicatorView.swift
//  IBDecodable
//
//  Created by phimage on 01/04/2018.
//

import SWXMLHash

protocol ActivityIndicatorViewProtocol: ViewProtocol {
    var style: String? { get }
    var color: Color? { get }
    var animating: Bool? { get }
    var hidesWhenStopped: Bool? { get }
}

@available(*, deprecated, message: "Use ActivityIndicatorView instead")
public typealias ActivityindicatorView = ActivityIndicatorView

public struct ActivityIndicatorView: IBDecodable, ActivityIndicatorViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UIActivityIndicatorView"
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
    public let ambiguous: Bool?
    public let variations: [Variation]?
    public let subviews: [AnyView]?
    public let fixedFrame: Bool?
    // MARK: ActivityIndicatorView
    public let style: String?
    public let color: Color?
    public let animating: Bool?
    public let hidesWhenStopped: Bool?

    enum ExternalCodingKeys: CodingKey { case color }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> ActivityIndicatorView {
        let view = try View.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let colors = xml.container(keys: ExternalCodingKeys.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        return ActivityIndicatorView(
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
            ambiguous: view.ambiguous,
            variations: view.variations,
            subviews: view.subviews,
            fixedFrame: view.fixedFrame,
            style: container.attributeIfPresent(of: .style),
            color: colors?.withAttributeElement(.key, CodingKeys.color.stringValue),
            animating: container.attributeIfPresent(of: .animating),
            hidesWhenStopped: container.attributeIfPresent(of: .hidesWhenStopped),
        )
    }
}
