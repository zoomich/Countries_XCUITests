//
//  MockTableViewDataSource.swift
//  CountriesChallenge
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import Foundation
import UIKit


class MockTableViewDataSource: NSObject, UITableViewDataSource {
    var rowCount = 0
    var cellForRow: UITableViewCell?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRow ?? UITableViewCell()
    }
}
