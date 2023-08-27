//
//  MediaViewModel.swift
//  Ideas
//
//  Created by Mauricio Martinez on 21/8/23.
//

import Foundation

final class MediaViewModel: MediaViewModelProtocol {

    private var service: InstagramServiceProtocol

    var state: MediaViewModelState = .idle

    var didChange: (() -> Void)?

    var showAlert: (() -> Void)?

    init(service: InstagramServiceProtocol) {
        self.service = service
    }

    func start() {
        loadData()
    }

    private func loadData() {
        Task {
            let data = await service.getMediaData()
            let loadedData = data.map { item in
                MediaCellViewModel(urlString: item.media_url, bottomText: item.caption, isFavorite: false, userName: item.username, didTapFav: {
                    self.didChange?()
                }, didTapTry: {
                    self.showAlert?()
                })
            }
            self.state = .loaded(loadedData)
            self.didChange?()
        }
    }
}

