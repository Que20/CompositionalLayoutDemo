//
//  Text.swift
//  CompositionalLayoutDemo
//
//  Created by Kévin MAAREK on 26/09/2019.
//  Copyright © 2019 Kévin MAAREK. All rights reserved.
//

import UIKit

public class Text: UICollectionViewCell {
     var container: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.white
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     var text: UILabel = {
         let label: UILabel = UILabel()
         label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed eros vitae nisl maximus ornare. Nunc faucibus enim eu posuere elementum. Proin id nunc non lectus tristique volutpat et ut turpis. Integer feugiat volutpat cursus. Duis vel eleifend lorem. Cras dapibus lectus sapien, sit amet egestas mauris venenatis vulputate. Pellentesque sit amet tortor odio. Nullam porta arcu tortor, eget efficitur enim sodales vel."
         label.numberOfLines = 0
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.contentView.addSubview(self.container)
         self.container.addSubview(self.text)
         
         NSLayoutConstraint.activate([
             self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor),
             self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
             self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
             self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
         ])
         
         NSLayoutConstraint.activate([
             self.text.topAnchor.constraint(equalTo: self.container.topAnchor),
             self.text.leftAnchor.constraint(equalTo: self.container.leftAnchor),
             self.text.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
             self.text.rightAnchor.constraint(equalTo: self.container.rightAnchor)
         ])
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }
