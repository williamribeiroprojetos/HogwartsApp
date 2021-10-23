//
//  CharactersTableCell.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 25/09/21.
//

import UIKit

class CharactersTableCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var imageURL: String = ""
    var name: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(value: Character) {
        self.characterNameLabel.text = value.name
        self.characterImageView.downloaded(from: value.image)
        self.characterImageView.layer.cornerRadius = 58
        self.characterImageView.clipsToBounds = true
        self.characterImageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.characterImageView.layer.masksToBounds = true

    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }

    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
