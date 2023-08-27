//
//  MediaCellViewModelProtocol.swift
//  Ideas
//
//  Created by Mauricio Martinez on 20/8/23.
//

import Foundation

protocol MediaCellViewModelProtocol {
    var urlString: String { get }
    var bottomText: String? { get }
    var didTapFav: () -> Void { get }
    var isFavorite: Bool { get set }
    var userName: String { get }
    var didTapTry: () -> Void { get }
}
