//    The MIT License (MIT)
//
//    Copyright (c) 2016 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit

/** @class TableViewBlockDataSource
 Provides a FLuent Interface / Fluent Builder Block-Based UITableViewDataSource implementation.
  */
public class TableViewBlockDataSource: NSObject {


    // MARK: - Properties

    /// The block used by func tableView:numberOfRowsInSection method
    public var numberOfRowsInSectionBlock: (tableView: UITableView, section: Int) -> Int
    /// the block used by func tableView:cellForRowAtIndexPath method
    public var cellForRowAtIndexPathBlock: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell
    /// the block used by func numberOfSectionsInTableView method
    public var numberOfSectionsInTableViewBlock: ((tableView: UITableView) -> Int)?
    /// the block used by func tableView:titleForHeaderInSection method
    public var titleForHeaderInSectionBlock: ((tableView: UITableView, section: Int) -> String?)?
    /// the block used by func tableView:titleForFooterInSection method
    public var titleForFooterInSectionBlock: ((tableView: UITableView, section: Int) -> String?)?
    /// the block used by func tableView:canEditRowAtIndexPath method
    public var canEditRowAtIndexPathBlock: ((tableView: UITableView, indexPath: NSIndexPath) -> Bool)?
    /// the block used by func tableView:canMoveRowAtIndexPath method
    public var canMoveRowAtIndexPathBlock: ((tableView: UITableView, canMoveRowAtIndexPath: NSIndexPath) -> Bool)?
    /// the block used by func sectionIndexTitlesForTableView method
    public var sectionIndexTitlesForTableViewBlock: ((tableView: UITableView) -> [String]?)?
    /// the block used by func tableView:sectionForSectionIndexTitle:atIndex method
    public var sectionForSectionIndexTitleBlock: ((tableView: UITableView, sectionForSectionIndexTitle: String, atIndex: Int) -> Int)?
    /// the block used by func tableView:commitEditingStyle:forRowAtIndexPath method
    public var commitEditingStyleBlock: ((tableView: UITableView, commitEditingStyle: UITableViewCellEditingStyle, forRowAtIndexPath: NSIndexPath) -> Void)?
    /// the block used by func tableView:moveRowAtIndexPath:toIndexPath method
    public var moveRowAtIndexPathBlock: ((tableView: UITableView, moveRowAtIndexPath: NSIndexPath, toIndexPath: NSIndexPath) -> Void)?


    // MARK: - Initialization

    /// Initializes with the required properties.
    public init(numberOfRowsInSection: (tableView: UITableView, section: Int) -> Int,
                cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell) {
        self.numberOfRowsInSectionBlock = numberOfRowsInSection
        self.cellForRowAtIndexPathBlock = cellForRowAtIndexPath
        super.init()
    }

    /// Sets the numberOfSectionsInTableViewBlock and returns self. Used to chain initialization.
    public func withNumberOfSectionsBlock(numberOfSectionsInTableViewBlock: ((tableView: UITableView) -> Int)) -> Self {
        self.numberOfSectionsInTableViewBlock = numberOfSectionsInTableViewBlock
        return self
    }

    /// Sets the titleForHeaderInSectionBlock and returns self. Used to chain initialization.
    public func withTitleForHeaderInSectionBlock(titleForHeaderInSectionBlock: ((tableView: UITableView, section: Int) -> String?)) -> Self {
        self.titleForHeaderInSectionBlock = titleForHeaderInSectionBlock
        return self
    }

    /// Sets the titleForFooterInSectionBlock and returns self. Used to chain initialization.
    public func withTitleForFooterInSectionBlock(titleForFooterInSectionBlock: ((tableView: UITableView, section: Int) -> String?)) -> Self {
        self.titleForFooterInSectionBlock = titleForFooterInSectionBlock
        return self
    }

    /// Sets the canEditRowAtIndexPathBlock and returns self. Used to chain initialization.
    public func withCanEditRowAtIndexPathBlock(canEditRowAtIndexPathBlock: ((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) -> Self {
        self.canEditRowAtIndexPathBlock = canEditRowAtIndexPathBlock
        return self
    }

    /// Sets the canMoveRowAtIndexPathBlock and returns self. Used to chain initialization.
    public func withCanMoveRowAtIndexPathBlock(canMoveRowAtIndexPathBlock: ((tableView: UITableView, canMoveRowAtIndexPath: NSIndexPath) -> Bool)) -> Self {
        self.canMoveRowAtIndexPathBlock = canMoveRowAtIndexPathBlock
        return self
    }

    /// Sets the sectionIndexTitlesForTableViewBlock and returns self. Used to chain initialization.
    public func withSectionIndexTitlesForTableViewBlock(sectionIndexTitlesForTableViewBlock: ((tableView: UITableView) -> [String]?)) -> Self {
        self.sectionIndexTitlesForTableViewBlock = sectionIndexTitlesForTableViewBlock
        return self
    }

    /// Sets the sectionForSectionIndexTitleBlock and returns self. Used to chain initialization.
    public func withSectionForSectionIndexTitleBlock(sectionForSectionIndexTitleBlock: ((tableView: UITableView, sectionForSectionIndexTitle: String, atIndex: Int) -> Int)) -> Self {
        self.sectionForSectionIndexTitleBlock = sectionForSectionIndexTitleBlock
        return self
    }

    /// Sets the commitEditingStyleBlock and returns self. Used to chain initialization.
    public func withCommitEditingStyleBlock(commitEditingStyleBlock: ((tableView: UITableView, commitEditingStyle: UITableViewCellEditingStyle, forRowAtIndexPath: NSIndexPath) -> Void)) -> Self {
        self.commitEditingStyleBlock = commitEditingStyleBlock
        return self
    }

    /// Sets the moveRowAtIndexPathBlock and returns self. Used to chain initialization.
    public func withMoveRowAtIndexPathBlock(moveRowAtIndexPathBlock: ((tableView: UITableView, moveRowAtIndexPath: NSIndexPath, toIndexPath: NSIndexPath) -> Void)) -> Self {
        self.moveRowAtIndexPathBlock = moveRowAtIndexPathBlock
        return self
    }

}

extension TableViewBlockDataSource: UITableViewDataSource {


    // MARK: - DataSource Implementation

    /// Will return the value of numberOfRowsInSectionBlock execution.
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRowsInSectionBlock(tableView: tableView, section: section)
    }


    // MARK: - Row Display

    /// Will return the value of cellForRowAtIndexPathBlock execution.
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.cellForRowAtIndexPathBlock(tableView: tableView, indexPath: indexPath)
    }

    /// Will return the value of numberOfSectionsInTableViewBlock execution. If not defined, will return 1.
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let block = self.numberOfSectionsInTableViewBlock else { return 1 }
        return block(tableView: tableView)
    }

    /// Will return the value of titleForHeaderInSectionBlock execution. If not defined, will return nil.
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let block = self.titleForHeaderInSectionBlock else { return nil }
        return block(tableView: tableView, section: section)
    }

    /// Will return the value of titleForFooterInSectionBlock execution. If not defined, will return nil.
    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let block = self.titleForFooterInSectionBlock else { return nil }
        return block(tableView: tableView, section: section)
    }


    // MARK: - Editing

    /// Will return the value of canEditRowAtIndexPathBlock execution. If not defined, will return true.
    public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        guard let block = self.canEditRowAtIndexPathBlock else { return true }
        return block(tableView: tableView, indexPath: indexPath)
    }


    // MARK: - Moving/reordering

    /// Will return the value of canMoveRowAtIndexPathBlock execution. If not defined, will return false.
    public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        guard let block = self.canMoveRowAtIndexPathBlock else { return false }
        return block(tableView: tableView, canMoveRowAtIndexPath: indexPath)
    }

    /// Will return the value of sectionIndexTitlesForTableViewBlock execution. If not defined, will return nil.
    public func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        guard let block = self.sectionIndexTitlesForTableViewBlock else { return nil }
        return block(tableView: tableView)
    }

    /// Will return the value of sectionForSectionIndexTitleBlock execution. If not defined, will return 0.
    public func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        guard let block = self.sectionForSectionIndexTitleBlock else { return 0 }
        return block(tableView: tableView, sectionForSectionIndexTitle: title, atIndex: index)
    }


    // MARK: - Data manipulation - insert and delete support

    /// Will execute the block commitEditingStyleBlock, if defined.
    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let block = self.commitEditingStyleBlock else { return }
        block(tableView: tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    }

    /// Will execute the block moveRowAtIndexPathBlock, if defined.
    public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        guard let block = self.moveRowAtIndexPathBlock else { return }
        block(tableView: tableView, moveRowAtIndexPath: sourceIndexPath, toIndexPath: destinationIndexPath)
    }

}
