//
//  ViewController.swift
//  RandomPhotos
//
//  Created by Vedant Arora on 02/07/23.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    } ()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Click Here", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    } ()
    let color : [UIColor] = [
    
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemCyan,
        .systemIndigo,
        .systemPurple,
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        getRandomPhoto()
        button.addTarget(self , action: #selector (didTap), for: .touchUpInside)
    }
    
    @objc func didTap(){
        getRandomPhoto()
        
        view.backgroundColor = color.randomElement()
    }
    override func viewDidLayoutSubviews() {
        view.addSubview(button)
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    func getRandomPhoto() {
        let urlString =
        "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)
        else{
            return
        }
        imageView.image = UIImage(data : data)
    }

}

