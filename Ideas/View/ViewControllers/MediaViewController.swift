//
//  MediaViewController.swift
//  Ideas
//
//  Created by Mauricio Martinez on 18/8/23.
//

import UIKit

enum SelectedSource {
    case daily
    case favorites
}

class MediaViewController: UIViewController {

    @IBOutlet weak var expiresLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedSource = .daily
            tableView.backgroundView = nil
            expiresLabel.isHidden = false
            subTitleLabel.isHidden = false
        case 1:
            selectedSource = .favorites
            let backgroundImageView = UIImageView(image: UIImage(named: "empty"))
            backgroundImageView.contentMode = .center
            tableView.backgroundView = backgroundImageView
            expiresLabel.isHidden = true
            subTitleLabel.isHidden = true
        default:
            return
        }
    }

    private var mediaDataList: [MediaCellViewModelProtocol] = []
    private var dataSource: [MediaCellViewModelProtocol] = []
    private let mediaTableViewCellIdentifier = "MediaTableViewCellIdentifier"
    private var viewModel: MediaViewModelProtocol = MediaViewModel(service: InstagramService.shared)
    private var selectedSource: SelectedSource = .daily {
        didSet {
            updateDataSource()
        }
    }

    private var favorites: [MediaCellViewModelProtocol] {
        return mediaDataList.filter({ $0.isFavorite })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.start()
        viewModel.didChange = {[weak self] in
            switch self?.viewModel.state {
            case.idle:
                return
            case.loaded(let data):
                self?.mediaDataList = data
                DispatchQueue.main.async {
                    self?.updateDataSource()
                }
            case .none:
                return
            }
        }
        viewModel.showAlert = {
            self.showAlertWith(titleText: "Try Button Tapped", messageText: "To be implemented.", buttonText: "Ok")
        }
    }

    private func updateDataSource() {
        switch selectedSource {
        case .daily:
            dataSource = mediaDataList
        case .favorites:
            dataSource = favorites
        }
        tableView.reloadData()
    }
}

extension MediaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: MediaTableViewCell = tableView.dequeueReusableCell(withIdentifier: mediaTableViewCellIdentifier, for: indexPath) as? MediaTableViewCell {
            cell.configureWith(viewModel: dataSource[indexPath.row])
            return cell
        }

        return UITableViewCell()
    }
}
