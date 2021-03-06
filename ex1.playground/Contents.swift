//: Playground - noun: a place where people can play

import UIKit
import RxSwift

var names = Variable(["dustin", "jimmy", "Ian", "Tom"])
print(names.value)

// asObserverable is create A sequense event. Nothing happen.
//An Observable is something which emits notifications of change.
//An Observer is something which subscribes to an Observable, in order to be notified when it has changed
names.asObservable()
    .filter { value in // Like in array , upon when emit new value
        return value.count > 2
    }
    .throttle(0.5, scheduler: MainScheduler.instance)
    .debug()
    .map { value in // Process in array to return the string to display to label
        return "Users: \(value.joined(separator: ", "))"
    }
    .subscribe(onNext: { value in // Subscribe . Tell observerable some one want to Observer data
    print("Name value is : \(value)")
})

names.value = ["a" , "b" , "c"]
names.value = ["a" , "b" , "d"]












