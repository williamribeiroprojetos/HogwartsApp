//
//  MyFavoritesViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 11/10/21.
//

import UIKit

class MyFavoritesViewController: UIViewController {

    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var myFavoritesTableView: UITableView!
    
    private let imageView = UIImageView(image: UIImage(named: "profile_icon"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFavoritesTableView.delegate = self
        myFavoritesTableView.dataSource = self
        myFavoritesTableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        myFavoritesTableView.register(UINib(nibName: "ContentTableCell", bundle: nil), forCellReuseIdentifier: "ContentTableCell")

        // Do any additional setup after loading the view.
        setupUI()
        
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action:#selector(imageTapped(tapGestureRecognizer:))
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true

        title = "Meus Favoritos"

        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])
    }
    
    private struct Const {
        /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 40
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 16
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 12
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
        /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
        /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let storyboard = UIStoryboard(name: "UserSettings", bundle: nil)
        let charactersVC = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        charactersVC.providesPresentationContextTransitionStyle = true
        charactersVC.definesPresentationContext = true
        navigationController?.pushViewController(charactersVC, animated: true)
    }
}

extension MyFavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: HeaderView? = tableView.dequeueReusableCell(withIdentifier: "HeaderView") as? HeaderView
        
        return view ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContentTableCell? = tableView.dequeueReusableCell(withIdentifier: "ContentTableCell", for: indexPath) as? ContentTableCell
        
        return cell ?? UITableViewCell()
    }
    
    
}
