//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 09/07/2025.
//

import StoryboardDecoder
import Foundation

func sut<T: ViewProtocol>(from file: String) throws -> T {
    let url = Bundle.module.url(forResource: file, withExtension: "xml")!
    let file = try StoryboardFile(url: url)
    guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
    guard let sut = viewController.rootView?.children(of: T.self).first else { throw IBError.elementNotFound }
    return sut
}
