//
//  TableViewCellTests.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 04/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("TableViewCell Tests")
struct TableViewCellTests {
    @Test func defaultState() async throws {
        guard let url = Bundle.module.url(forResource: "TableViewCell_Default", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let tableViews = vc?.rootView?.children(of: TableView.self) else { throw IBError.elementNotFound }
        guard let tableViewCells = tableViews[0].prototypeCells else { throw IBError.elementNotFound }
        let sut = tableViewCells[0]
        #expect(sut.elementClass == "UITableViewCell")
        #expect(sut.id == "t5h-iQ-M3Z")
        #expect(sut.clipsSubviews == true)
        #expect(sut.contentMode == "scaleToFill")
        #expect(sut.preservesSuperviewLayoutMargins == true)
        #expect(sut.rect != nil)
        // TODO: Check if autoresizing mask should not fail if data is empty
        // #expect(sut.autoresizingMask == nil)
        #expect(sut.style == nil)
        #expect(sut.imageView == nil)
        #expect(sut.textLabel == nil)
        #expect(sut.reuseIdentifier == nil)
        #expect(sut.selectionStyle == "default")
        #expect(sut.accessoryType == nil)
        #expect(sut.editingAccessoryType == nil)
        #expect(sut.focusStyle == nil)
        #expect(sut.indentationLevel == nil)
        #expect(sut.indentationWidth == 10)
        #expect(sut.shouldIndentWhileEditing == nil)
        #expect(sut.showsReorderControl == nil)
        #expect(sut.separatorInset == nil)
        #expect(sut.rowHeight == nil)
        #expect(sut.contentView.key == "contentView")
        #expect(sut.contentView.opaque == false)
        #expect(sut.contentView.clipsSubviews == true)
        #expect(sut.contentView.multipleTouchEnabled == true)
        #expect(sut.contentView.contentMode == "center")
        #expect(sut.contentView.preservesSuperviewLayoutMargins == true)
        #expect(sut.contentView.insetsLayoutMarginsFromSafeArea == false)
        #expect(sut.contentView.id == "1PI-ZF-W6X")
        #expect(sut.contentView.rect != nil)
        // TODO: see line 26
        //#expect(sut.contentView.autoresizingMask == nil)

    }
}
