
# Example of DataRequest for ReactiveKit

Using Alamofire (4.2.0), 

Bond (5.1.2),

ReactiveKit (3.1.1)

[Actual issue](https://github.com/ReactiveKit/ReactiveAlamofire/issues/2)

## Usage example:

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

## Contact

Aleksandr Zaporozhchenko
[[github]](https://github.com/Maxatma)  [[gmail]](mailto:maxatma.ids@gmail.com)  [[fb]](https://www.facebook.com/profile.php?id=100008291260780)  [[in]](https://www.linkedin.com/in/maxatma/)
