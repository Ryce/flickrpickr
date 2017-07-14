//
//  SomeClass.swift
//  flickrpickr-sdk
//
//  Created by Hamon Riazy on 14/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import Foundation
import JudoKit


class Whatever {
    
    func doSomething() {
        let session = JudoKit(token: "bla", secret: "blubb")
        try? session.invokePayment("134134", amount: Amount(amountString: "34.12", currency: .GBP), reference: Reference(consumerRef: "some reference")!) { (response, error) in
            // foobar
        }
    }
    
}
