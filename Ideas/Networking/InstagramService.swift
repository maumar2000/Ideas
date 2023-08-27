//
//  InstagramService.swift
//  Ideas
//
//  Created by Mauricio Martinez on 17/8/23.
//

import Foundation

class InstagramService: InstagramServiceProtocol {
    static let shared = InstagramService()

    #error("Add user token")
    private let userToken = ""

    private init () {}

    func getMediaData() async  -> [MediaData] {
        let urlString = "\(graphApiUrl)me/media?fields=id,username,caption,media_url,timestamp&access_token=\(userToken)"
        guard let url = URL(string: urlString) else {
            return []
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonData = try JSONDecoder().decode(Feed.self, from: data)
            return jsonData.data
        }
        catch {
            return []
        }

    }
}
