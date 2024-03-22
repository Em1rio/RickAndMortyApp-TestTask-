//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 21.03.2024.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
    // MARK: - Variables
    var navController: UINavigationController?
    private(set) var viewModel: CharacterDetailViewModel?
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.label.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        return createLabel(fontSize: 18, fontWeight: .medium)
    }()
    private lazy var statusLabel: UILabel = {
        return createLabel(fontSize: 16, fontWeight: .regular)
    }()
    private lazy var genderLabel: UILabel = {
        return createLabel(fontSize: 16, fontWeight: .regular)
    }()
    private lazy var speciesLabel: UILabel = {
        return createLabel(fontSize: 16, fontWeight: .regular)
    }()
    private lazy var originLabel: UILabel = {
        return createLabel(fontSize: 16, fontWeight: .regular)
    }()
    // MARK: - Lifecycle
    init(_ viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        addUIObjects()
        addConstraints()
        
    }
    private func addUIObjects() {
        view.addSubviews(containerView)
        containerView.addSubviews(imageView, nameLabel, statusLabel, genderLabel, originLabel, speciesLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            speciesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            speciesLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            statusLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            genderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            genderLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            originLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            originLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
            
            
        ])
    }
    
    private func createLabel(fontSize: CGFloat, fontWeight: UIFont.Weight , textColor: UIColor? = UIColor.label) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textAlignment = .left
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    //MARK: - Setup Data
    func setupData(with character: Character) {
        guard let viewModel = viewModel else {return}
        let characterDetail = viewModel.prepareData()
        nameLabel.text = "\(characterDetail.name)"
        statusLabel.text = "\(characterDetail.status)"
        genderLabel.text = "\(characterDetail.gender)"
        originLabel.text = "\(characterDetail.origin)"
        speciesLabel.text = "\(characterDetail.species)"
        viewModel.fetchImage(character.image) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
    
    
    
}
