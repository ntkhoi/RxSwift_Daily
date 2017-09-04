//: Playground - noun: a place where people can play

import UIKit
import RxSwift

// SHARE REPLAY

var names = Variable(["dustin", "jimmy", "Ian", "Tom"])
let nameObserverable = names.asObservable().shareReplay(1)
print(names.value)


//Subscribe First observerable return a string to display to label
// Observerable is immuable
let subscribe1 =  nameObserverable
    .filter { value in // Like in array , upon when emit new value
        return value.count > 2
    }
    .debug()
    .map { value in // Process in array to return the string to display to label
        return "Users: \(value.joined(separator: ", "))"
    }
    .subscribe(onNext: { value in // Subscribe . Tell observerable some one want to Observer data
        print("Name value is : \(value)")
    })

let subscribe2 =  nameObserverable
    .debug()
    .subscribe(onNext: { (value) in
    print("Observer2: \(value)")
})

subscribe1.dispose()



names.value = ["dustin" , "eminem ",  "taylor" ,"edele"]














