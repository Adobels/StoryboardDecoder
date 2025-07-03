//
//  Button.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol ButtonProtocol: ViewProtocol, ControlProtocol {
    var buttonType: String? { get }
    var fixedFrame: Bool? { get }
    var fontDescription: FontDescription? { get }
    var lineBreakMode: String? { get }
    var state: [Button.State]? { get }
    // MARK: Size Inspector
    /*
     var contentEdgeInsets: Inset? { get }
     var titleEdgeInsets: Inset? { get }
     var imageEdgeInsets: Inset? { get }
     */
}

public struct Button: IBDecodable, ButtonProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
    public let elementClass: String = "UIButton"
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
    // MARK: UIControl
    public let contentHorizontalAlignment: String?
    public let contentVerticalAlignment: String?
    public let showsMenuAsPrimaryAction: Bool?
    public let isSelected: Bool?
    public let isEnabled: Bool?
    public let isHighlighted: Bool?
    public let toolTip: String?
    // MARK: UIButton
    public let buttonType: String?
    public let fixedFrame: Bool?
    public let fontDescription: FontDescription?
    public let lineBreakMode: String?
    public let state: [State]?

    enum ConstraintsCodingKeys: CodingKey { case constraint }
    enum VariationCodingKey: CodingKey { case variation }
    enum ExternalCodingKeys: CodingKey { case color }
    enum ColorsCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Button {
        let view = try View.decode(xml)
        let control = try Control.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        return Button(
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
            contentHorizontalAlignment:                 control.contentHorizontalAlignment,
            contentVerticalAlignment:                   control.contentVerticalAlignment,
            showsMenuAsPrimaryAction:                   control.showsMenuAsPrimaryAction,
            isSelected:                                 control.isSelected,
            isEnabled:                                  control.isEnabled,
            isHighlighted:                              control.isHighlighted,
            toolTip:                                    control.toolTip,
            buttonType:                                 container.attributeIfPresent(of: .buttonType),
            fixedFrame:                                 container.attributeIfPresent(of: .fixedFrame),
            fontDescription:                            container.elementIfPresent(of: .fontDescription),
            lineBreakMode:                              container.attributeIfPresent(of: .lineBreakMode),
            state:                                      container.elementsIfPresent(of: .state),
        )
    }

    public struct State: IBDecodable, IBKeyable {
        public let key: String?
        public let title: String?
        public let color: Color? ///`Color` maybe have been replaced by `titleColor` and `titleShadowColor`
        public let titleColor: Color?
        public let titleShadowColor: Color?
        public let image: String?
        public let backgroundImage: String?
        public let catalog: String?

        static func decode(_ xml: XMLIndexerType) throws -> Button.State {
            let container = xml.container(keys: CodingKeys.self)
            let colorsContainer = xml.container(keys: ExternalCodingKeys.self)
                .nestedContainerIfPresent(of: .color, keys: ColorsCodingKeys.self)
            return State.init(
                key: try container.attribute(of: .key),
                title: container.attributeIfPresent(of: .title),
                color: container.elementIfPresent(of: .color),
                titleColor: colorsContainer?.withAttributeElement(.key, CodingKeys.titleColor.stringValue),
                titleShadowColor: colorsContainer?.withAttributeElement(.key, CodingKeys.titleShadowColor.stringValue),
                image: container.attributeIfPresent(of: .image),
                backgroundImage: container.attributeIfPresent(of: .backgroundImage),
                catalog: container.attributeIfPresent(of: .catalog)
            )
        }
    }
}
