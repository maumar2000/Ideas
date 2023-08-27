//
//  InstagramServiceProtocol.swift
//  Ideas
//
//  Created by Mauricio Martinez on 24/8/23.
//

import Foundation

protocol InstagramServiceProtocol {
    func getMediaData() async  -> [MediaData]
}
