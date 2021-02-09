//
//  ApiManager.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Foundation
import Alamofire
import RxSwift

public class ApiManager: HttpClientInterface {
    
    // MARK: - To manage Alamofire requests -
    private var session = Session()
    
    // MARK: - To decode JSON response -
    private var jsonDecoder = JSONDecoder()
    
    public init(interceptor: ApiInterceptor, eventMonitors: ApiEventMonitor) {
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 60
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        session = Session(configuration: configuration, startRequestsImmediately: true, interceptor: interceptor, eventMonitors: [eventMonitors])
        
    }
    
    // MARK: - Single Stream Methods -
    public func executeRequest<R>(urlRequestConvertible: URLRequestConvertible) -> Single<R> where R: CodableDataProtocol{
        
        return Single.create { [weak self] (single) -> Disposable in
            
            self?.session.request(urlRequestConvertible).validate().response(completionHandler: { (alamofireResponseData) in
                self?.responseParser(alamofireResponseData: alamofireResponseData, single: single)
            })
            return Disposables.create()
        }
    }
    
    public func responseParser<R>(alamofireResponseData: AFDataResponse<Data?>, single: (SingleEvent<R>) -> Void) where R: CodableDataProtocol {
        
        switch alamofireResponseData.result {
        case .failure(let error):
            single(.failure(GenericErrorResponseModule(errorResponse: BaseErrorResponse(statusCode: returnErrorCode(error: error), statusMessage: error.localizedDescription, success: false), apiConnectionErrorType: .serverError(returnErrorCode(error: error)))))
            print(error)
            
        case .success(let data):
            if let data = data {
                
                do {
                    let dataDecoded = try jsonDecoder.decode(R.self, from: data)
                    single(.success(dataDecoded))
                } catch let error {
                    print("error : \(error)")
                }
            }
        }
    }
    
    // MARK: - Observable Stream Methods -
    public func executeRequestAsObservable<R>(urlRequestConvertible: URLRequestConvertible) -> Observable<R> where R : CodableDataProtocol {
        return Observable<R>.create{ [weak self] (observable) -> Disposable in
            
            self?.session.request(urlRequestConvertible).validate().response(completionHandler: { (alamofireResponseData) in
                self?.alamofireResponseParser(alamofireResponseData: alamofireResponseData, observable: observable)
            })
            
            return Disposables.create()
        }
    }
    
    public func alamofireResponseParser<R>(alamofireResponseData: AFDataResponse<Data?>, observable: (AnyObserver<R>)) where R : CodableDataProtocol {
        
        switch alamofireResponseData.result {
        case .failure(let error):
            observable.onError(GenericErrorResponseModule(errorResponse: BaseErrorResponse(statusCode: returnErrorCode(error: error), statusMessage: error.localizedDescription, success: false)))
        case .success(let data):
            if let data = data {
                
                do {
                    let dataDecoded = try jsonDecoder.decode(R.self, from: data)
                    observable.onNext(dataDecoded)
                    observable.onCompleted()
                } catch let error {
                    print("error : \(error.localizedDescription)")
                    observable.onError(error)
                }
            }
        }
    }
    
    private func returnStatusCode(data: AFDataResponse<Data?>) -> Int {
        guard let response = data.response else { return 0 }
        return response.statusCode
    }
    
    private func returnErrorCode(error: AFError) -> Int {
        guard let underlyingError = error.underlyingError else { return NSURLErrorUnknown }
        return underlyingError._code
    }
    
    deinit {
        print("DENIT APIMANAGER")
    }
}
