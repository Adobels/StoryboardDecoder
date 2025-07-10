//
//  TestHelpers.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 09/07/2025.
//

import StoryboardDecoder
import Foundation

func sut<T: IBElement>(from file: String) throws -> T {
    guard let url = Bundle.module.url(forResource: file, withExtension: "xml") else { throw IBError.elementNotFound }
    let file = try StoryboardFile(url: url)
    guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
    guard let sut = viewController.rootView?.children(of: T.self).first else { throw IBError.elementNotFound }
    return sut
}
func suts<T: IBElement>(from file: String) throws -> [T] {
    guard let url = Bundle.module.url(forResource: file, withExtension: "xml") else { throw IBError.elementNotFound }
    let file = try StoryboardFile(url: url)
    guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
    guard let sut = viewController.rootView?.children(of: T.self) else { throw IBError.elementNotFound }
    return sut
}
