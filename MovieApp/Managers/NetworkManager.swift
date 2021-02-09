//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation
import Network
import UIKit

class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true
    
    func startMonitoring(viewController: UIViewController) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            
            if path.status == .satisfied {
                print("We're connected!")
                // post connected notification
            } else {
                DispatchQueue.main.sync {
                    let alertController = UIAlertController(title: "Network Connection Problem", message: "Your device is not connected to the Internet!", preferredStyle: .alert)
                    
                    let indicator = UIActivityIndicatorView(frame: alertController.view.bounds)
                    indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    
                    alertController.view.addSubview(indicator)
                    indicator.isUserInteractionEnabled = false
                    
                    let tryAgainAction = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) {
                        UIAlertAction -> Void in
                        self?.startMonitoring(viewController: viewController)
                    }
                    alertController.addAction(tryAgainAction)
                    indicator.startAnimating()

                    viewController.present(alertController, animated: true, completion: nil)
                }
                // post disconnected notification
            }
            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
}
