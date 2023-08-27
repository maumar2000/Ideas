//
//  MediaViewModelState.swift
//  Ideas
//
//  Created by Mauricio Martinez on 21/8/23.
//

import Foundation

enum MediaViewModelState {
    case idle
    case loaded([MediaCellViewModelProtocol])
}
