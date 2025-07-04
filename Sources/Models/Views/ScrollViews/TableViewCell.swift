//
//  TableViewCell.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

protocol TableViewCellProtocol {
    var style: String? { get }
    var imageView: String? { get }
    var textLabel: String? { get }
    var reuseIdentifier: String? { get }
    var selectionStyle: String? { get }
    var accessoryType: String? { get }
    var editingAccessoryType: String? { get }
    var focusStyle: String? { get }
    var indentationLevel: Int? { get }
    var indentationWidth: Float? { get }
    var shouldIndentWhileEditing: Bool? { get }
    var showsReorderControl: Bool? { get }
    var separatorInset: Inset? { get }
    var rowHeight: Float? { get }
    var contentView: TableViewCell.TableViewContentView { get }
}

public struct TableViewCell: IBDecodable, ViewProtocol, TableViewCellProtocol, IBIdentifiable, IBReusable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UITableViewCell"
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
    //public let subviews: [AnyView]?
    // MARK: TableViewCell
    public let style: String?
    public let imageView: String?
    public let textLabel: String?
    public let reuseIdentifier: String?
    public let selectionStyle: String?
    public let accessoryType: String?
    public let editingAccessoryType: String?
    public let focusStyle: String?
    public let indentationLevel: Int?
    public let indentationWidth: Float?
    public let shouldIndentWhileEditing: Bool?
    public let showsReorderControl: Bool?
    public let separatorInset: Inset?
    public let rowHeight: Float?
    public let contentView: TableViewContentView
    private let _subviews: [AnyView]?
    public var subviews: [AnyView]? {
        return (_subviews ?? []) + [AnyView(contentView)]
    }

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

    enum ElementKeys: CodingKey { case inset }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let view = try View.decode(xml)
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .ambiguous: return "ambiguous"

                case ._subviews: return "subview"
                case .contentView: return "tableViewCellContentView"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        let insets = xml.container(keys: ElementKeys.self).nestedContainerIfPresent(of: .inset, keys: KeyCodingKeys.self)
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
            ambiguous: view.ambiguous,
            variations: view.variations,
            style: container.attributeIfPresent(of: .style),
            imageView: container.attributeIfPresent(of: .imageView),
            textLabel: container.attributeIfPresent(of: .textLabel),
            reuseIdentifier: container.attributeIfPresent(of: .reuseIdentifier),
            selectionStyle: container.attributeIfPresent(of: .selectionStyle),
            accessoryType: container.attributeIfPresent(of: .accessoryType),
            editingAccessoryType: container.attributeIfPresent(of: .editingAccessoryType),
            focusStyle: container.attributeIfPresent(of: .focusStyle),
            indentationLevel: container.attributeIfPresent(of: .indentationLevel),
            indentationWidth: container.attributeIfPresent(of: .indentationWidth),
            shouldIndentWhileEditing: container.attributeIfPresent(of: .shouldIndentWhileEditing),
            showsReorderControl: container.attributeIfPresent(of: .showsReorderControl),
            separatorInset: insets?.withAttributeElement(.key, CodingKeys.separatorInset.stringValue),
            rowHeight: container.attributeIfPresent(of: .rowHeight),
            contentView: try container.element(of: .contentView),
            _subviews: container.childrenIfPresent(of: ._subviews),
        )
    }
}
