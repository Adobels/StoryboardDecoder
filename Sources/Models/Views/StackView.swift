//
//  StackView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol StackViewProtocol {
    var axis: String { get }
    var distribution: String? { get }
    var alignment: String? { get }
    var spacing: Int? { get }
    var baselineRelativeArrangement: Bool? { get }
}

public struct StackView: IBDecodable, ViewProtocol, StackViewProtocol, IBIdentifiable {

    public let id: String
    public let elementClass: String = "UIStackView"
    public let key: String?
    public let autoresizingMask: AutoresizingMask?
    public let clipsSubviews: Bool?
    public let constraints: [Constraint]?
    public let contentMode: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let opaque: Bool?
    public let rect: Rect?
    public let subviews: [AnyView]?
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let userInteractionEnabled: Bool?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let backgroundColor: Color?
    public let tintColor: Color?
    public let hidden: Bool?
    public let alpha: Float?
    public let axis: String
    public let distribution: String?
    public let alignment: String?
    public let spacing: Int?
    public let baselineRelativeArrangement: Bool?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let accessibility: Accessibility?
    public let tag: Int?
    public let autoresizesSubviews: Bool?
    public let clearsContextBeforeDrawing: Bool?
    public let multipleTouchEnabled: Bool?
    public let semanticContentAttribute: String?
    public let preservesSuperviewLayoutMargins: Bool?
    public let layoutMarginsFollowReadableWidth: Bool?
    public let insetsLayoutMarginsFromSafeArea: Bool?
    public let directionalLayoutMargins: DirectionalEdgeInsets?
    public let layoutMargins: EdgeInset?
    /* TODO: Add support for viewLayoutGuide
     <viewLayoutGuide key="safeArea" id="hJ6-lb-hKq"/>
     <keyboardLayoutGuide key="keyboard" id="XH4-lu-ej3"/>
     */

    static func decode(_ xml: XMLIndexerType) throws -> StackView {
        let view = try View.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        return StackView(
            id:                                        view.id,
            key:                                       view.key,
            autoresizingMask:                          view.autoresizingMask,
            clipsSubviews:                             view.clipsSubviews,
            constraints:                               view.constraints,
            contentMode:                               view.contentMode,
            customClass:                               view.customClass,
            customModule:                              view.customModule,
            customModuleProvider:                      view.customModuleProvider,
            restorationIdentifier:                     view.restorationIdentifier,
            userLabel:                                 view.userLabel,
            colorLabel:                                view.colorLabel,
            isMisplaced:                               view.isMisplaced,
            isAmbiguous:                               view.isAmbiguous,
            verifyAmbiguity:                           view.verifyAmbiguity,
            opaque:                                    view.opaque,
            rect:                                      view.rect,
            subviews:                                  view.subviews,
            translatesAutoresizingMaskIntoConstraints: view.translatesAutoresizingMaskIntoConstraints,
            userInteractionEnabled:                    view.userInteractionEnabled,
            userDefinedRuntimeAttributes:              view.userDefinedRuntimeAttributes,
            connections:                               view.connections,
            variations:                                view.variations,
            backgroundColor:                           view.backgroundColor,
            tintColor:                                 view.tintColor,
            hidden:                                    view.hidden,
            alpha:                                     view.alpha,
            axis:                                      container.attributeIfPresent(of: .axis) ?? "horizontal",
            distribution:                              container.attributeIfPresent(of: .distribution),
            alignment:                                 container.attributeIfPresent(of: .alignment),
            spacing:                                   container.attributeIfPresent(of: .spacing),
            baselineRelativeArrangement:               container.attributeIfPresent(of: .baselineRelativeArrangement),
            horizontalCompressionResistancePriority:   view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority:     view.verticalCompressionResistancePriority,
            horizontalHuggingPriority:                 view.horizontalHuggingPriority,
            verticalHuggingPriority:                   view.verticalHuggingPriority,
            accessibility:                             view.accessibility,
            tag:                                       view.tag,
            autoresizesSubviews:                       view.autoresizesSubviews,
            clearsContextBeforeDrawing:                view.clearsContextBeforeDrawing,
            multipleTouchEnabled:                      view.multipleTouchEnabled,
            semanticContentAttribute:                  view.semanticContentAttribute,
            preservesSuperviewLayoutMargins:           view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth:          view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea:           view.insetsLayoutMarginsFromSafeArea,
            directionalLayoutMargins:                  view.directionalLayoutMargins,
            layoutMargins:                             view.layoutMargins,
        )
    }
}
