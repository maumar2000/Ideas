//
//  MediaTableViewCell.swift
//  Ideas
//
//  Created by Mauricio Martinez on 18/8/23.
//

import UIKit
import SDWebImage
import UIGradient

class MediaTableViewCell: UITableViewCell {

    @IBOutlet var mediaImageView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!


    @IBAction func didTapFavButton(_ sender: UIButton) {

        let isFavorite = viewModel?.isFavorite  ?? false
        viewModel?.isFavorite = !isFavorite
        updateFavButton()
        viewModel?.didTapFav()
    }

    @IBAction func tryButtonTapped(_ sender: Any) {
        viewModel?.didTapTry()
    }

    private var viewModel: MediaCellViewModelProtocol?
    private let gradientSize = 50
    
    override func awakeFromNib() {
        super.awakeFromNib()

        gradientView.backgroundColor = UIColor.fromGradientWithDirection(.bottomLeftToTopRight, frame: CGRect(x: 0, y: 0, width: gradientSize, height: gradientSize), colors: [.yellow, .purple])
        gradientView.layer.cornerRadius = CGFloat(gradientSize / 2)
    }

    func configureWith(viewModel: MediaCellViewModelProtocol) {
        self.viewModel = viewModel
        guard let url = URL(string: viewModel.urlString) else {
            return
        }
        mediaImageView.sd_setImage(with: url)
        userNameLabel.text = viewModel.userName
        configureBottomText()
        updateFavButton()
    }

    private func configureBottomText() {
        if let bottomText = viewModel?.bottomText {
            let latoBoldFont = UIFont(16, .bold)
            let userNameAttribuites: [NSAttributedString.Key: Any] = [.font: latoBoldFont as Any]
            let userNameString = NSMutableAttributedString(string: (viewModel?.userName ?? "") + " ", attributes: userNameAttribuites)
            let latoRegularFont = UIFont(16, .regular)
            let bottomAttribuites: [NSAttributedString.Key: Any] = [.font: latoRegularFont as Any, .foregroundColor: UIColor.darkGray]
            let bottomTextString = NSAttributedString(string: bottomText, attributes: bottomAttribuites)
            userNameString.append(bottomTextString)
            bottomLabel.attributedText = userNameString
        } else {
            bottomLabel.attributedText = nil
        }
    }

    private func updateFavButton() {
        if viewModel?.isFavorite == false {
            favoriteButton.isSelected = false
            favoriteButton.tintColor = .darkGray
        } else {
            favoriteButton.isSelected = true
            favoriteButton.tintColor = .red
        }
    }
}




