//
//  ViewController.swift
//  ReactiveAlamofire
//
//  Created by Alexander Zaporozhchenko on 12/4/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

import Alamofire
import Bond

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiString           = "https://pixabay.com/api/"
        let apiKey              = "2558715-0fea309eb5cf824cd64a2e01f"
        let defaultSearchString = "red roses"
        let parameters = [ "key" : apiKey,
                           "q" : defaultSearchString]
        
        
        Alamofire.request(apiString,
                          method: .get,
                          parameters: parameters)
            .toSignal()
            .observeNext(with: { (response, request, data) in
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print(error)
                }
            })
            .disposeIn(bnd_bag)
    }
}

