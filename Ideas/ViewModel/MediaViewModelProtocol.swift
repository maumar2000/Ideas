//
//  MediaViewModelProtocol.swift
//  Ideas
//
//  Created by Mauricio Martinez on 21/8/23.
//

import Foundation

protocol MediaViewModelProtocol {

    /// Current view model's state.
    var state: MediaViewModelState { get }

    /// A closure that is invoked after the object has changed.
    var didChange: (() -> Void)? { get set }

    /// A closure to show an alert on the view controller.
    var showAlert: (() -> Void)? { get set }

    /// Starts view model.
    /// It's expected that implementation of this method should have logic responsible for
    /// view model starting process, e.g. loading initial content.
    func start()
}
