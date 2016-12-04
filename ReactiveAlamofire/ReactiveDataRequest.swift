//
//  ReactiveDataRequest.swift
//  ReactiveAlamofire
//
//  Created by Alexander Zaporozhchenko on 12/4/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

import Alamofire
import ReactiveKit


extension DataRequest {
    
    public func toSignal() -> Signal<(URLRequest?, HTTPURLResponse?, Data?), AFError> {
        return Signal { observer in
            
            let request = self.response { handlerStruct in
                
                if let error = handlerStruct.error  {
                    observer.failed(error as! AFError)
                } else {
                    observer.next(handlerStruct.request, handlerStruct.response, handlerStruct.data)
                    observer.completed()
                }
            }
            
            request.resume()
            
            return BlockDisposable {
                request.cancel()
            }
        }
    }
}
