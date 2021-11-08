//
//  HeaderView.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 20/10/21.
//

import UIKit

final class HeaderView: UIView {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Init cycle

      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      }

      override init(frame: CGRect) {
        super.init(frame: frame)
      }
    
    //MARK: - Public methods

  class func loadViewFromNib(_view: UIView) -> HeaderView {
      let nib = UINib(nibName: String(describing: self), bundle: nil)
      let view = nib.instantiate(withOwner: self, options: nil).first as! HeaderView
      view.frame = _view.frame
      
      return view
    }
}
