//
//  ViewController.swift
//  uiDesign
//
//  Created by Macbook on 2/23/22.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var mainImageCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var roomAndRatesTableView: UITableView!
    
    
    public let viewModel = ViewModel()
    public let disposeBag = DisposeBag()
    var hotelList: [HotelVO] = []
    var roomList: [RoomVO] = []
    var rateList: [RateVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageCollectionView.delegate = self
        mainImageCollectionView.dataSource =  self
        roomAndRatesTableView.delegate = self
        roomAndRatesTableView.dataSource = self
        
        let mainImagelayout = mainImageCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        mainImagelayout.minimumLineSpacing = 10
        mainImagelayout.itemSize = CGSize(width: (self.view.frame.width - 50), height: 200)
        mainImageCollectionView.register(UINib(nibName: String(describing: MainImageCollectionViewCell.self) , bundle: nil), forCellWithReuseIdentifier: String(describing: MainImageCollectionViewCell.self))
        
        roomAndRatesTableView.register(UINib(nibName: String(describing: RoomTableViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: RoomTableViewCell.self) )
        
        self.roomAndRatesTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
        self.roomAndRatesTableView.rowHeight = 360
        roomAndRatesTableView.separatorStyle = .none
        configureBarButtons()
        self.getAllHotelList()
        self.getAllRoomList()
        self.getAllRateList()
    }
    
    func getAllHotelList(){
        viewModel.getHotelList().observe(on: MainScheduler.instance).subscribe(onNext: { response in
            self.hotelList = response
        }).disposed(by: disposeBag)
    }
    
    func getAllRoomList(){
        viewModel.getRoomList().observe(on: MainScheduler.instance).subscribe(onNext: { response in
            self.roomList = response
        }).disposed(by: disposeBag)
    }
    
    func getAllRateList(){
        viewModel.getRateList().observe(on: MainScheduler.instance).subscribe(onNext: { response in
            self.rateList = response
        }).disposed(by: disposeBag)
    }

    @IBAction func segmentControlAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
            {
            case 0:
            roomAndRatesTableView.register(UINib(nibName: String(describing: RoomTableViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: RoomTableViewCell.self) )
            roomAndRatesTableView.reloadData()
            case 1:
            roomAndRatesTableView.register(UINib(nibName: String(describing: RateTableViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: RateTableViewCell.self) )
            roomAndRatesTableView.reloadData()
            default:
                break
            }
    }
    
    func configureBarButtons(){
        navigationController?.navigationBar.tintColor = .label
        
        let currencyImage = UIImage(named: "currency")
        let currencyImageWidth = currencyImage?.size.width
        let currencyImageHeight = currencyImage?.size.height
        let currencyButton:UIButton = UIButton(frame: CGRect(x: 0,y: 0,width: currencyImageWidth!, height: currencyImageHeight!))
        currencyButton.setBackgroundImage(currencyImage, for: .normal)
        currencyButton.addTarget(self, action: #selector(navigationRightItemAction), for: .touchUpInside)
        
        let chatactiveImage = UIImage(named: "chatactive")
        let chatactiveImageWidth = chatactiveImage?.size.width
        let chatactiveImageHeight = chatactiveImage?.size.height
        let chatactiveButton:UIButton = UIButton(frame: CGRect(x: 0,y: 0,width: chatactiveImageWidth!, height: chatactiveImageHeight!))
        chatactiveButton.setBackgroundImage(chatactiveImage, for: .normal)
        chatactiveButton.addTarget(self, action: #selector(navigationRightItemAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: chatactiveButton),UIBarButtonItem(customView: currencyButton)]
    }

    @objc func navigationRightItemAction(){}
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hotelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainImageCollectionViewCell.self), for: indexPath) as! MainImageCollectionViewCell
        item.mdata = hotelList[indexPath.row]
        return item
    }
}
extension ViewController: UICollectionViewDelegate{}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 1
        switch segmentControl.selectedSegmentIndex
            {
            case 0:
            return roomList.count
            case 1:
            return rateList.count
            default:
                break
            }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RoomTableViewCell.self), for: indexPath) as! RoomTableViewCell
        switch segmentControl.selectedSegmentIndex
            {
            case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RoomTableViewCell.self), for: indexPath) as! RoomTableViewCell
            cell.mdata = self.roomList[indexPath.row]
            return cell
            self.roomAndRatesTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
            roomAndRatesTableView.reloadData()
            
            case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RateTableViewCell.self), for:indexPath) as! RateTableViewCell
            cell.mdata = self.rateList[indexPath.row]
            return cell
            roomAndRatesTableView.reloadData()
            self.roomAndRatesTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 10)
            default:
                break
            }
        return cell
    }
}
extension ViewController: UITableViewDelegate{}
