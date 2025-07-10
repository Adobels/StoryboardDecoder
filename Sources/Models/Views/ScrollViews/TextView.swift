//
//  TextView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol TextViewProtocol: ViewProtocol, ScrollViewProtocol {
    var fontDescription: FontDescription? { get }
    var text: String? { get }
    var textAlignment: String? { get }
    var textColor: Color? { get }
    var editable: Bool? { get }
    var textInputTraits: TextField.TextInputTraits? { get }
}

public struct TextView: IBDecodable, TextViewProtocol, IBIdentifiable {
    // MARK: View
    public let id: String
    public let key: String?
    public let elementClass: String = "UITextView"
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
    // MARK: ScrollView
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
    // MARK: TextView
    public let fontDescription: FontDescription?
    public let text: String?
    public let textAlignment: String?
    public let textColor: Color?
    public let editable: Bool?
    public let textInputTraits: TextField.TextInputTraits?

    enum ElementKey: CodingKey { case color, string, textInputTraits }

    static func decode(_ xml: XMLIndexerType) throws -> TextView {
        let view = try View.decode(xml)
        let scrollView = try ScrollView.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let elementContainer = xml.container(keys: ElementKey.self)
        let textInputTraits = elementContainer.nestedContainerIfPresent(of: .textInputTraits, keys: KeyCodingKeys.self)
        let colors = elementContainer.nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let stringsContainer = elementContainer.nestedContainerIfPresent(of: .string, keys: KeyCodingKeys.self)
        var text: String? = container.attributeIfPresent(of: .text)
        if text == nil {
            let multiLineText: StringElement? = stringsContainer?.withAttributeElement(.key, CodingKeys.text.stringValue)
            text = multiLineText?.elementValue
        }
        return TextView(
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
            indicatorStyle: scrollView.indicatorStyle,
            showsHorizontalScrollIndicator: scrollView.showsHorizontalScrollIndicator,
            showsVerticalScrollIndicator: scrollView.showsVerticalScrollIndicator,
            scrollEnabled: scrollView.scrollEnabled,
            pagingEnabled: scrollView.pagingEnabled,
            directionalLockEnabled: scrollView.directionalLockEnabled,
            bounces: scrollView.bounces,
            bouncesZoom: scrollView.bouncesZoom,
            alwaysBounceHorizontal: scrollView.alwaysBounceHorizontal,
            alwaysBounceVertical: scrollView.alwaysBounceVertical,
            minimumZoomScale: scrollView.minimumZoomScale,
            maximumZoomScale: scrollView.maximumZoomScale,
            delaysContentTouches: scrollView.delaysContentTouches,
            canCancelContentTouches: scrollView.canCancelContentTouches,
            keyboardDismissMode: scrollView.keyboardDismissMode,
            scrollIndicatorInsets: scrollView.scrollIndicatorInsets,
            contentInsetAdjustmentBehavior: scrollView.contentInsetAdjustmentBehavior,
            contentLayoutGuide: scrollView.contentLayoutGuide,
            frameLayoutGuide: scrollView.frameLayoutGuide,
            fontDescription: container.elementIfPresent(of: .fontDescription),
            text: text,
            textAlignment: container.attributeIfPresent(of: .textAlignment),
            textColor: colors?.withAttributeElement(.key, CodingKeys.textColor.stringValue),
            editable: container.attributeIfPresent(of: .editable),
            textInputTraits: textInputTraits?.withAttributeElement(.key, CodingKeys.textInputTraits.stringValue),
        )
    }
}
