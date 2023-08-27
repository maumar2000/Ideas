//
//  MediaCellViewModel.swift
//  Ideas
//
//  Created by Mauricio Martinez on 21/8/23.
//

import Foundation

final class MediaCellViewModel: MediaCellViewModelProtocol {

    init(urlString: String, bottomText: String?, isFavorite: Bool, userName: String, didTapFav: @escaping () -> Void, didTapTry: @escaping () -> Void) {
        self.urlString = urlString
        self.bottomText = bottomText
        self.isFavorite = isFavorite
        self.userName = userName
        self.didTapFav = didTapFav
        self.didTapTry = didTapTry
    }

    var urlString: String = ""
    var bottomText: String?
    var didTapFav: () -> Void
    var isFavorite: Bool = false
    var userName: String
    var didTapTry: () -> Void
}
