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
        var sut = tableViewCells[0].view
        #expect(sut.elementClass == "UITableViewCell")
        #expect(sut.id == "t5h-iQ-M3Z")
        #expect(sut.clipsSubviews == true)
        #expect(sut.contentMode == "scaleToFill")
        #expect(sut.preservesSuperviewLayoutMargins == true)
        #expect(sut.rect != nil)
        // TODO: Check if autoresizing mask should not fail if data is empty
        // #expect(sut.autoresizingMask == nil)
        let value: String? = "Hello, Swift Testing!"
        let cell = try #require(sut as? TableViewCell)
        #expect(cell.style == nil)
        #expect(cell.imageView == nil)
        #expect(cell.textLabel == nil)
        #expect(cell.reuseIdentifier == nil)
        #expect(cell.selectionStyle == "default")
        #expect(cell.accessoryType == nil)
        #expect(cell.editingAccessoryType == nil)
        #expect(cell.focusStyle == nil)
        #expect(cell.indentationLevel == nil)
        #expect(cell.indentationWidth == 10)
        #expect(cell.shouldIndentWhileEditing == nil)
        #expect(cell.showsReorderControl == nil)
        #expect(cell.separatorInset == nil)
        #expect(cell.rowHeight == nil)
        let contentView = try #require(cell.contentView.nested as? TableViewCell.TableViewContentView)
        #expect(contentView.key == "contentView")
        #expect(contentView.opaque == false)
        #expect(contentView.clipsSubviews == true)
        #expect(contentView.multipleTouchEnabled == true)
        #expect(contentView.contentMode == "center")
        #expect(contentView.preservesSuperviewLayoutMargins == true)
        #expect(contentView.insetsLayoutMarginsFromSafeArea == false)
        #expect(contentView.id == "1PI-ZF-W6X")
        #expect(contentView.rect != nil)
        // TODO: see line 26
        //#expect(sut.contentView.autoresizingMask == nil)

    }
}
