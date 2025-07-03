//
//  ProgressView.swift
//  IBDecodable
//
//  Created by phimage on 01/04/2018.
//

import SWXMLHash

protocol ProgressViewProtocol: ViewProtocol {
    var progressTintColor: Color? { get }
    var trackTintColor: Color? { get }
    var progress: Float? { get }
    var progressImage: String? { get }
    var trackImage: String? { get }
}

public struct ProgressView: IBDecodable, ProgressViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
    public let elementClass: String = "UIProgressView"
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
    // MARK: UIProgressView
    public let progressTintColor: Color?
    public let trackTintColor: Color?
    public let progress: Float?
    public let progressImage: String?
    public let trackImage: String?

    enum ExternalCodingKeys: CodingKey { case color }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> ProgressView {
        let view = try View.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let containerColors = xml.container(keys: ExternalCodingKeys.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        return ProgressView(
            key:                                        view.key,
            id:                                         view.id,
            customClass:                                view.customClass,
            customModule:                               view.customModule,
            customModuleProvider:                       view.customModuleProvider,
            restorationIdentifier:                      view.restorationIdentifier,
            userDefinedRuntimeAttributes:               view.userDefinedRuntimeAttributes,
            userLabel:                                  view.userLabel,
            colorLabel:                                 view.colorLabel,
            accessibility:                              view.accessibility,
            contentMode:                                view.contentMode,
            semanticContentAttribute:                   view.semanticContentAttribute,
            tag:                                        view.tag,
            userInteractionEnabled:                     view.userInteractionEnabled,
            multipleTouchEnabled:                       view.multipleTouchEnabled,
            alpha:                                      view.alpha,
            backgroundColor:                            view.backgroundColor,
            tintColor:                                  view.tintColor,
            opaque:                                     view.opaque,
            hidden:                                     view.hidden,
            clearsContextBeforeDrawing:                 view.clearsContextBeforeDrawing,
            clipsSubviews:                              view.clipsSubviews,
            autoresizesSubviews:                        view.autoresizesSubviews,
            rect:                                       view.rect,
            translatesAutoresizingMaskIntoConstraints:  view.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask:                           view.autoresizingMask,
            directionalLayoutMargins:                   view.directionalLayoutMargins,
            layoutMargins:                              view.layoutMargins,
            preservesSuperviewLayoutMargins:            view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth:           view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea:            view.insetsLayoutMarginsFromSafeArea,
            horizontalHuggingPriority:                  view.horizontalHuggingPriority,
            verticalHuggingPriority:                    view.verticalHuggingPriority,
            horizontalCompressionResistancePriority:    view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority:      view.verticalCompressionResistancePriority,
            constraints:                                view.constraints,
            connections:                                view.connections,
            variations:                                 view.variations,
            subviews:                                   nil,
            verifyAmbiguity:                            view.verifyAmbiguity,
            isMisplaced:                                view.isMisplaced,
            isAmbiguous:                                view.isAmbiguous,
            progressTintColor:                          containerColors?.withAttributeElement(.key, CodingKeys.progressTintColor.stringValue),
            trackTintColor:                             containerColors?.withAttributeElement(.key, CodingKeys.trackTintColor.stringValue),
            progress:                                   container.attributeIfPresent(of: .progress),
            progressImage:                              container.attributeIfPresent(of: .progressImage),
            trackImage:                                 container.attributeIfPresent(of: .trackImage),
        )
    }
}
