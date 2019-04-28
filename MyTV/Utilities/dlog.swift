//
//  dlog.swift
//  MyTV
//
//  Created by Andre Heß on 28.04.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import Foundation
import os.log

public func DLog(_ text: String, _ args: CVarArg...) {
    os_log("%@%@", text, args)
}
