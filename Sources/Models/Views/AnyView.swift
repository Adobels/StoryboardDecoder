//
//  AnyView.swift
//  IBLinterCore
//
//  Created by Steven Deutsch on 3/11/18.
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
    // MARK: Others
    var variations: [Variation]? { get }
    var subviews: [AnyView]? { get }
}

// MARK: - AnyView

public struct AnyView: IBDecodable, CustomDebugStringConvertible {

    public var debugDescription: String { nested.customClass ?? nested.elementClass }
    public let view: ViewProtocol

    init(_ view: ViewProtocol) {
        self.view = view
    }

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ xml: XMLIndexerType) throws -> AnyView {
        guard let elementName = xml.elementName else {
            throw IBError.elementNotFound
        }
        return switch elementName {
        case "activityIndicatorView": try AnyView(ActivityIndicatorView.decode(xml))
        case "arscnView": try AnyView(ARSCNView.decode(xml))
        case "arskView": try AnyView(ARSKView.decode(xml))
        case "button": try AnyView(Button.decode(xml))
        case "collectionView": try AnyView(CollectionView.decode(xml))
        case "collectionViewCell": try AnyView(CollectionViewCell.decode(xml))
        case "collectionReusableView": try AnyView(CollectionReusableView.decode(xml))
        case "containerView": try AnyView(View.decode(xml))
        case "datePicker": try AnyView(DatePicker.decode(xml))
        case "glkView": try AnyView(GLKView.decode(xml))
        case "imageView": try AnyView(ImageView.decode(xml))
        case "label": try AnyView(Label.decode(xml))
        case "mapView": try AnyView(MapView.decode(xml))
        case "mtkView": try AnyView(MTKView.decode(xml))
        case "navigationBar": try AnyView(NavigationBar.decode(xml))
        case "pageControl": try AnyView(PageControl.decode(xml))
        case "pickerView": try AnyView(PickerView.decode(xml))
        case "progressView": try AnyView(ProgressView.decode(xml))
        case "sceneKitView": try AnyView(SceneKitView.decode(xml))
        case "scrollView": try AnyView(ScrollView.decode(xml))
        case "searchBar": try AnyView(SearchBar.decode(xml))
        case "segmentedControl": try AnyView(SegmentedControl.decode(xml))
        case "skView": try AnyView(SKView.decode(xml))
        case "slider": try AnyView(Slider.decode(xml))
        case "stackView": try AnyView(StackView.decode(xml))
        case "stepper": try AnyView(Stepper.decode(xml))
        case "switch": try AnyView(Switch.decode(xml))
        case "tabBar": try AnyView(TabBar.decode(xml))
        case "tableView": try AnyView(TableView.decode(xml))
        case "tableViewCell": try AnyView(TableViewCell.decode(xml))
        case "tableViewCellContentView": try AnyView(TableViewCell.TableViewContentView.decode(xml))
        case "textField": try AnyView(TextField.decode(xml))
        case "textView": try AnyView(TextView.decode(xml))
        case "toolbar": try AnyView(Toolbar.decode(xml))
        case "view": try AnyView(View.decode(xml))
        case "visualEffectView": try AnyView(VisualEffectView.decode(xml))
        case "wkWebView": try AnyView(WKWebView.decode(xml))
        default: throw IBError.unsupportedViewClass(elementName)
        }
    }

}

extension AnyView: IBAny {
    public typealias NestedElement = ViewProtocol
    public var nested: ViewProtocol {
        return view
    }
}

// MARK: - AutoresizingMask

public struct AutoresizingMask: IBDecodable, IBKeyable {
    public let key: String?
    public let widthSizable: Bool
    public let heightSizable: Bool
    public let flexibleMaxX: Bool
    public let flexibleMaxY: Bool

    static func decode(_ xml: XMLIndexerType) throws -> AutoresizingMask {
        let container = xml.container(keys: CodingKeys.self)
        return AutoresizingMask(
            key: container.attributeIfPresent(of: .key),
            widthSizable: container.attributeIfPresent(of: .widthSizable) ?? false,
            heightSizable: container.attributeIfPresent(of: .heightSizable) ?? false,
            flexibleMaxX: container.attributeIfPresent(of: .flexibleMaxX) ?? false,
            flexibleMaxY: container.attributeIfPresent(of: .flexibleMaxY) ?? false
        )
    }
}

// MARK: - VerifyAmbiguity

public enum VerifyAmbiguity: XMLAttributeDecodable, KeyDecodable {
    case off // Never Verify
    case ignoreSizes // Verify Position Only
    case other(String)

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ attribute: XMLAttribute) throws -> VerifyAmbiguity {
        switch attribute.text {
        case "off": return .off
        case "ignoreSizes": return .ignoreSizes
        default: return .other(attribute.text)
        }
    }
}

// MARK: - Constraint

public struct Constraint: IBDecodable, IBIdentifiable {
    public let id: String
    public let constant: Float?
    public let priority: Float?
    public let multiplier: String?
    public let firstItem: String?
    public let firstAttribute: LayoutAttribute?
    public let secondItem: String?
    public let secondAttribute: LayoutAttribute?
    public let identifier: String?
    public let relation: Relation

    public enum LayoutAttribute: XMLAttributeDecodable, KeyDecodable, Equatable {
        case left, right, top, bottom, leading, trailing,
        width, height, centerX, centerY

        case leftMargin, rightMargin, topMargin,
        bottomMargin, leadingMargin, trailingMargin

        case other(String)

        public func encode(to encoder: Encoder) throws { fatalError() }

        static func decode(_ attribute: XMLAttribute) throws -> Constraint.LayoutAttribute {
            switch attribute.text {
            case "left": .left
            case "right": .right
            case "top": .top
            case "bottom": .bottom
            case "leading": .leading
            case "trailing": .trailing
            case "width": .width
            case "height": .height
            case "centerX": .centerX
            case "centerY": .centerY
            case "leftMargin": .leftMargin
            case "rightMargin": .rightMargin
            case "topMargin": .topMargin
            case "bottomMargin": .bottomMargin
            case "leadingMargin": .leadingMargin
            case "trailingMargin": .trailingMargin
            default: .other(attribute.text)
            }
        }

        public static func == (lhs: LayoutAttribute, rhs: LayoutAttribute) -> Bool {
            switch (lhs, rhs) {
            case (.left, .left), (.right, .right), (.top, .top), (.bottom, .bottom),
                 (.leading, .leading), (.trailing, .trailing), (.width, .width),
                 (.height, height), (.centerX, .centerX), (.centerY, .centerY),
                 (.leftMargin, .leftMargin), (.rightMargin, .rightMargin),
                 (.topMargin, .topMargin), (.bottomMargin, .bottomMargin),
                 (.leadingMargin, .leadingMargin), (.trailingMargin, .trailingMargin): return true
            case (.other(let msg1), .other(let msg2)): return msg1 == msg2
            default: return false
            }
        }
    }

    public enum Relation: XMLAttributeDecodable, KeyDecodable, Equatable {
        case lessThanOrEqual, greaterThanOrEqual, equal, other(String)

        static func decode(_ attribute: XMLAttribute) throws -> Constraint.Relation {
            switch attribute.text {
            case "lessThanOrEqual": .lessThanOrEqual
            case "greaterThanOrEqual": .greaterThanOrEqual
            default: .other(attribute.text)
            }
        }
    }

    static func decode(_ xml: XMLIndexerType) throws -> Constraint {
        let container = xml.container(keys: CodingKeys.self)
        return Constraint(
            id: try container.attribute(of: .id),
            constant: container.attributeIfPresent(of: .constant),
            priority: container.attributeIfPresent(of: .priority),
            multiplier: container.attributeIfPresent(of: .multiplier),
            firstItem: container.attributeIfPresent(of: .firstItem),
            firstAttribute: container.attributeIfPresent(of: .firstAttribute),
            secondItem: container.attributeIfPresent(of: .secondItem),
            secondAttribute: container.attributeIfPresent(of: .secondAttribute),
            identifier: container.attributeIfPresent(of: .identifier),
            relation: container.attributeIfPresent(of: .relation) ?? .equal
        )
    }
}
