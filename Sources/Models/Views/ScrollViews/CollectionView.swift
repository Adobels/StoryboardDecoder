//
//  CollectionView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

// MARK: - CollectionView

public struct CollectionView: IBDecodable, ViewProtocol, ScrollViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UICollectionView"
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
    public let bouncesZoom: Bool?
    public let bounces: Bool?
    public let alwaysBounceVertical: Bool?
    public let keyboardDismissMode: String?
    public let showsVerticalScrollIndicator: Bool? // default true
    public let showsHorizontalScrollIndicator: Bool? // default true
    public let maximumZoomScale: Float?
    public let minimumZoomScale: Float?
    public let isDirectionalLockEnabled: Bool?
    public let indicatorStyle: IndicatorStyle?
    public let scrollEnabled: Bool?
    public let alwaysBounceHorizontal: Bool?
    public let delaysContentTouches: Bool?
    public let canCancelContentTouches: Bool?
    public let pagingEnabled: Bool?
    public let directionalLockEnabled: Bool?
    public let scrollIndicatorInsets: Inset?
    public let contentInsetAdjustmentBehavior: String?
    public let contentLayoutGuide: LayoutGuide?
    public let frameLayoutGuide: LayoutGuide?
    // MARK: CollectionView
    public let cells: [CollectionViewCell]?
    public let collectionReusableViews: [CollectionReusableView]?
    public var sectionHeaderView: CollectionReusableView? {
        return collectionReusableViews?.first(where: { $0.key == "sectionHeaderView" })
    }
    public var sectionFooterView: CollectionReusableView? {
        return collectionReusableViews?.first(where: { $0.key == "sectionFooterView" })
    }
    public let layout: CollectionViewLayout?
    public let flowLayout: CollectionViewFlowLayout?
    public let isPrefetchingEnabled: Bool?

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let view = try View.decode(xml)
        let scrollView = try ScrollView.decode(xml)
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .layout: return "collectionViewLayout"
                case .flowLayout: return "collectionViewFlowLayout"
                case .isDirectionalLockEnabled: return "directionalLockEnabled"
                case .isPrefetchingEnabled: return "prefetchingEnabled"
                case .collectionReusableViews: return "collectionReusableView"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
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
            bouncesZoom: scrollView.bouncesZoom,
            bounces: scrollView.bounces,
            alwaysBounceVertical: scrollView.alwaysBounceVertical,
            keyboardDismissMode: scrollView.keyboardDismissMode,
            showsVerticalScrollIndicator: scrollView.showsVerticalScrollIndicator,
            showsHorizontalScrollIndicator: scrollView.showsHorizontalScrollIndicator,
            maximumZoomScale: scrollView.maximumZoomScale,
            minimumZoomScale: scrollView.minimumZoomScale,
            isDirectionalLockEnabled: scrollView.directionalLockEnabled,
            indicatorStyle: scrollView.indicatorStyle,
            scrollEnabled: scrollView.scrollEnabled,
            alwaysBounceHorizontal: scrollView.alwaysBounceHorizontal,
            delaysContentTouches: scrollView.delaysContentTouches,
            canCancelContentTouches: scrollView.canCancelContentTouches,
            pagingEnabled: scrollView.pagingEnabled,
            directionalLockEnabled: scrollView.directionalLockEnabled,
            scrollIndicatorInsets: scrollView.scrollIndicatorInsets,
            contentInsetAdjustmentBehavior: scrollView.contentInsetAdjustmentBehavior,
            contentLayoutGuide: scrollView.contentLayoutGuide,
            frameLayoutGuide: scrollView.frameLayoutGuide,
            cells: container.childrenIfPresent(of: .cells),
            collectionReusableViews: container.elementsIfPresent(of: .collectionReusableViews),
            layout: container.elementIfPresent(of: .layout),
            flowLayout: container.elementIfPresent(of: .flowLayout),
            isPrefetchingEnabled: container.attributeIfPresent(of: .isPrefetchingEnabled),
        )
    }
}

// MARK: - CollectionViewLayout

public struct CollectionViewLayout: IBDecodable, IBIdentifiable, IBKeyable, IBCustomClassable {

    public let id: String
    public let key: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?

    static func decode(_ xml: XMLIndexerType) throws -> CollectionViewLayout {
        let container = xml.container(keys: CodingKeys.self)
        return CollectionViewLayout(
            id:                       try container.attribute(of: .id),
            key:                      container.attributeIfPresent(of: .key),
            customClass:              container.attributeIfPresent(of: .customClass),
            customModule:             container.attributeIfPresent(of: .customModule),
            customModuleProvider:     container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier:    container.attributeIfPresent(of: .restorationIdentifier),
            userLabel:                container.attributeIfPresent(of: .userLabel),
            colorLabel:               container.attributeIfPresent(of: .colorLabel)
        )
    }
}

// MARK: - CollectionViewFlowLayout

public struct CollectionViewFlowLayout: IBDecodable, IBIdentifiable, IBKeyable {

    public let id: String
    public let key: String?
    public let minimumLineSpacing: String?
    public let minimumInteritemSpacing: String?
    public let sizes: [Size]?
    public let insets: [Inset]?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let scrollDirection: String? // vertical, horizontal
    public let automaticEstimatedItemSize: Bool?

    static func decode(_ xml: XMLIndexerType) throws -> CollectionViewFlowLayout {
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .key: return "contentMode"
                case .sizes: return "size"
                case .insets: return "inset"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        return CollectionViewFlowLayout(
            id:                         try container.attribute(of: .id),
            key:                        container.attributeIfPresent(of: .key),
            minimumLineSpacing:         container.attributeIfPresent(of: .minimumLineSpacing),
            minimumInteritemSpacing:    container.attributeIfPresent(of: .minimumInteritemSpacing),
            sizes:                      container.elementsIfPresent(of: .sizes),
            insets:                     container.elementsIfPresent(of: .insets),
            customClass:                container.attributeIfPresent(of: .customClass),
            customModule:               container.attributeIfPresent(of: .customModule),
            customModuleProvider:       container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier:      container.attributeIfPresent(of: .restorationIdentifier),
            scrollDirection:            container.attributeIfPresent(of: .scrollDirection),
            automaticEstimatedItemSize: container.attributeIfPresent(of: .automaticEstimatedItemSize)
        )
    }
}
