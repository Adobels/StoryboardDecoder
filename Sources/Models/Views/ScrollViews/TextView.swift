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
}

public struct TextView: IBDecodable, TextViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
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
    // MARK: UIScrollView
    public let isPagingEnabled: Bool?
    public let bouncesZoom: Bool?
    public let bounces: Bool?
    public let alwaysBounceVertical: Bool?
    public let keyboardDismissMode: String?
    public let showsVerticalScrollIndicator: Bool? // default true
    public let showsHorizontalScrollIndicator: Bool? // default true
    public let maximumZoomScale: Float?
    public let minimumZoomScale: Float?
    public let isDirectionalLockEnabled: Bool?
    public let contentLayoutGuide: LayoutGuide?
    public let frameLayoutGuide: LayoutGuide?
    public let indicatorStyle: IndicatorStyle?
    public let scrollEnabled: Bool?
    public let alwaysBounceHorizontal: Bool?
    public let delaysContentTouches: Bool?
    public let canCancelContentTouches: Bool?
    public let keyboard: LayoutGuide?
    public let safeArea: LayoutGuide?
    // UIScrollView Properties in Attributes Inspector
    public let pagingEnabled: Bool?
    public let directionalLockEnabled: Bool?
    // UIScrollView Properties in Size Inspector
    public let scrollIndicatorInsets: Inset?
    public let contentInsetAdjustmentBehavior: String?
    // move here the contentLayoutGuide and frameLayoutGuide properties

    public let fontDescription: FontDescription?
    public let text: String?
    public let textAlignment: String?
    public let textColor: Color?
    public let editable: Bool?

    enum ElementKey: CodingKey {
        case color
        case string
        case constraint
        case directionalEdgeInsets
        case edgeInsets
        case inset
        case variation
        case viewLayoutGuide
    }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> TextView {
        let view = try View.decode(xml)
        let scrollView = try ScrollView.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let elementContainer = xml.container(keys: ElementKey.self)
        let colorsContainer = elementContainer.nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let stringsContainer = elementContainer.nestedContainerIfPresent(of: .string, keys: KeyCodingKeys.self)
        var text: String? = container.attributeIfPresent(of: .text)
        if text == nil {
            let multiLineText: StringElement? = stringsContainer?.withAttributeElement(.key, CodingKeys.text.stringValue)
            text = multiLineText?.elementValue
        }
        return TextView(
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
            isPagingEnabled:                            scrollView.isPagingEnabled,
            bouncesZoom:                                scrollView.bouncesZoom,
            bounces:                                    scrollView.bounces,
            alwaysBounceVertical:                       scrollView.alwaysBounceVertical,
            keyboardDismissMode:                        scrollView.keyboardDismissMode,
            showsVerticalScrollIndicator:               scrollView.showsVerticalScrollIndicator,
            showsHorizontalScrollIndicator:             scrollView.showsHorizontalScrollIndicator,
            maximumZoomScale:                           scrollView.maximumZoomScale,
            minimumZoomScale:                           scrollView.minimumZoomScale,
            isDirectionalLockEnabled:                   scrollView.isDirectionalLockEnabled,
            contentLayoutGuide:                         scrollView.contentLayoutGuide,
            frameLayoutGuide:                           scrollView.frameLayoutGuide,
            indicatorStyle:                             scrollView.indicatorStyle,
            scrollEnabled:                              scrollView.scrollEnabled,
            alwaysBounceHorizontal:                     scrollView.alwaysBounceHorizontal,
            delaysContentTouches:                       scrollView.delaysContentTouches,
            canCancelContentTouches:                    scrollView.canCancelContentTouches,
            keyboard:                                   nil,
            safeArea:                                   nil,
            pagingEnabled:                              scrollView.pagingEnabled,
            directionalLockEnabled:                     scrollView.directionalLockEnabled,
            scrollIndicatorInsets:                      scrollView.scrollIndicatorInsets,
            contentInsetAdjustmentBehavior:             scrollView.contentInsetAdjustmentBehavior,
            fontDescription:                            container.elementIfPresent(of: .fontDescription),
            text:                                       text,
            textAlignment:                              container.attributeIfPresent(of: .textAlignment),
            textColor:                                  colorsContainer?.withAttributeElement(.key, CodingKeys.textColor.stringValue),
            editable:                                   container.attributeIfPresent(of: .editable),
        )
    }
}
