//
//  ImageView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol ImageViewProtocol: ViewProtocol {
    var fixedFrame: Bool? { get }
    var image: String? { get }
    var highlightedImage: String? { get }
    var highlighted: Bool? { get }
    var adjustsImageSizeForAccessibilityContentSizeCategory: Bool? { get }
    var catalog: String? { get }
}

public struct ImageView: IBDecodable, ImageViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
    public let elementClass: String = "UIImageView"
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
    // MARK: UIImageView
    public let fixedFrame: Bool?
    public let image: String?
    public let highlightedImage: String?
    public let highlighted: Bool?
    public let adjustsImageSizeForAccessibilityContentSizeCategory: Bool?
    public let catalog: String?

    static func decode(_ xml: XMLIndexerType) throws -> ImageView {
        let view = try View.decode(xml)
        let imageView = xml.container(keys: CodingKeys.self)
        return ImageView(
            key:                                                    view.key,
            id:                                                     view.id,
            customClass:                                            view.customClass,
            customModule:                                           view.customModule,
            customModuleProvider:                                   view.customModuleProvider,
            restorationIdentifier:                                  view.restorationIdentifier,
            userDefinedRuntimeAttributes:                           view.userDefinedRuntimeAttributes,
            userLabel:                                              view.userLabel,
            colorLabel:                                             view.colorLabel,
            accessibility:                                          view.accessibility,
            contentMode:                                            view.contentMode,
            semanticContentAttribute:                               view.semanticContentAttribute,
            tag:                                                    view.tag,
            userInteractionEnabled:                                 view.userInteractionEnabled,
            multipleTouchEnabled:                                   view.multipleTouchEnabled,
            alpha:                                                  view.alpha,
            backgroundColor:                                        view.backgroundColor,
            tintColor:                                              view.tintColor,
            opaque:                                                 view.opaque,
            hidden:                                                 view.hidden,
            clearsContextBeforeDrawing:                             view.clearsContextBeforeDrawing,
            clipsSubviews:                                          view.clipsSubviews,
            autoresizesSubviews:                                    view.autoresizesSubviews,
            rect:                                                   view.rect,
            translatesAutoresizingMaskIntoConstraints:              view.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask:                                       view.autoresizingMask,
            directionalLayoutMargins:                               view.directionalLayoutMargins,
            layoutMargins:                                          view.layoutMargins,
            preservesSuperviewLayoutMargins:                        view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth:                       view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea:                        view.insetsLayoutMarginsFromSafeArea,
            horizontalHuggingPriority:                              view.horizontalHuggingPriority,
            verticalHuggingPriority:                                view.verticalHuggingPriority,
            horizontalCompressionResistancePriority:                view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority:                  view.verticalCompressionResistancePriority,
            constraints:                                            view.constraints,
            connections:                                            view.connections,
            variations:                                             view.variations,
            subviews:                                               nil,
            verifyAmbiguity:                                        view.verifyAmbiguity,
            isMisplaced:                                            view.isMisplaced,
            isAmbiguous:                                            view.isAmbiguous,
            fixedFrame:                                             imageView.attributeIfPresent(of: .fixedFrame),
            image:                                                  imageView.attributeIfPresent(of: .image),
            highlightedImage:                                       imageView.attributeIfPresent(of: .highlightedImage),
            highlighted:                                            imageView.attributeIfPresent(of: .highlighted),
            adjustsImageSizeForAccessibilityContentSizeCategory:    imageView.attributeIfPresent(of: .adjustsImageSizeForAccessibilityContentSizeCategory),
            catalog:                                                imageView.attributeIfPresent(of: .catalog),
        )
    }
}
