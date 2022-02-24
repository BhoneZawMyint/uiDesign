//
//  ViewModel.swift
//  uiDesign
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    public func getHotelList() -> Observable<[HotelVO]>{
        return Observable.create{observer -> Disposable in
            observer.onNext(HotelVO.getHotelList())
            return Disposables.create()
        }
    }
    
    public func getRoomList() -> Observable<[RoomVO]>{
        return Observable.create{observer -> Disposable in
            observer.onNext(RoomVO.getRoomList())
            return Disposables.create()
        }
    }
    
    public func getRateList() -> Observable<[RateVO]>{
        return Observable.create{observer -> Disposable in
            observer.onNext(RoomVO.getRoomList())
            return Disposables.create()
        }
    }
}
