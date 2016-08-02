//
//  TableViewBlockDataSource.swift
//  Pods
//
//  Created by José Inácio Athayde Ferrarini on 02/08/16.
//
//

import UIKit

public class TableViewBlockDataSource: NSObject {

    public var numberOfRowsInSectionBlock: (tableView: UITableView, section: Int) -> Int
    public var cellForRowAtIndexPathBlock: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell
    public var numberOfSectionsInTableViewBlock: ((tableView: UITableView) -> Int)?
    public var titleForHeaderInSectionBlock: ((tableView: UITableView, section: Int) -> String?)?
    public var titleForFooterInSectionBlock: ((tableView: UITableView, section: Int) -> String?)?
    public var canEditRowAtIndexPathBlock: ((tableView: UITableView, indexPath: NSIndexPath) -> Bool)?
    public var canMoveRowAtIndexPathBlock: ((tableView: UITableView, canMoveRowAtIndexPath: NSIndexPath) -> Bool)?
    public var sectionIndexTitlesForTableViewBlock: ((tableView: UITableView) -> [String]?)?
    public var sectionForSectionIndexTitleBlock: ((tableView: UITableView, sectionForSectionIndexTitle: String, atIndex: Int) -> Int)?
    public var commitEditingStyleBlock: ((tableView: UITableView, commitEditingStyle: UITableViewCellEditingStyle, forRowAtIndexPath: NSIndexPath) -> Void)?
    public var moveRowAtIndexPathBlock: ((tableView: UITableView, moveRowAtIndexPath: NSIndexPath, toIndexPath: NSIndexPath) -> Void)?


    // MARK: - Initialization

    public init(numberOfRowsInSection: (tableView: UITableView, section: Int) -> Int,
                cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell) {
        self.numberOfRowsInSectionBlock = numberOfRowsInSection
        self.cellForRowAtIndexPathBlock = cellForRowAtIndexPath
        super.init()
    }

    public func withNumberOfSectionsBlock(numberOfSectionsInTableViewBlock: ((tableView: UITableView) -> Int)) -> Self {
        self.numberOfSectionsInTableViewBlock = numberOfSectionsInTableViewBlock
        return self
    }

    public func withTitleForHeaderInSectionBlock(titleForHeaderInSectionBlock: ((tableView: UITableView, section: Int) -> String?)) -> Self {
        self.titleForHeaderInSectionBlock = titleForHeaderInSectionBlock
        return self
    }

    public func withTitleForFooterInSectionBlock(titleForFooterInSectionBlock: ((tableView: UITableView, section: Int) -> String?)) -> Self {
        self.titleForFooterInSectionBlock = titleForFooterInSectionBlock
        return self
    }

    public func withCanEditRowAtIndexPathBlock(canEditRowAtIndexPathBlock: ((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) -> Self {
        self.canEditRowAtIndexPathBlock = canEditRowAtIndexPathBlock
        return self
    }

    public func withCanMoveRowAtIndexPathBlock(canMoveRowAtIndexPathBlock: ((tableView: UITableView, canMoveRowAtIndexPath: NSIndexPath) -> Bool)) -> Self {
        self.canMoveRowAtIndexPathBlock = canMoveRowAtIndexPathBlock
        return self
    }

    public func withSectionIndexTitlesForTableViewBlock(sectionIndexTitlesForTableViewBlock: ((tableView: UITableView) -> [String]?)) -> Self {
        self.sectionIndexTitlesForTableViewBlock = sectionIndexTitlesForTableViewBlock
        return self
    }

    public func withSectionForSectionIndexTitleBlock(sectionForSectionIndexTitleBlock: ((tableView: UITableView, sectionForSectionIndexTitle: String, atIndex: Int) -> Int)) -> Self {
        self.sectionForSectionIndexTitleBlock = sectionForSectionIndexTitleBlock
        return self
    }

    public func withCommitEditingStyleBlock(commitEditingStyleBlock: ((tableView: UITableView, commitEditingStyle: UITableViewCellEditingStyle, forRowAtIndexPath: NSIndexPath) -> Void)) -> Self {
        self.commitEditingStyleBlock = commitEditingStyleBlock
        return self
    }

    public func withMoveRowAtIndexPathBlock(moveRowAtIndexPathBlock: ((tableView: UITableView, moveRowAtIndexPath: NSIndexPath, toIndexPath: NSIndexPath) -> Void)) -> Self {
        self.moveRowAtIndexPathBlock = moveRowAtIndexPathBlock
        return self
    }

}

extension TableViewBlockDataSource: UITableViewDataSource {


    // MARK: - DataSource Implementation

    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRowsInSectionBlock(tableView: tableView, section: section)
    }


    // MARK: - Row Display

    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.cellForRowAtIndexPathBlock(tableView: tableView, indexPath: indexPath)
    }

    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let block = self.numberOfSectionsInTableViewBlock else { return 1 }
        return block(tableView: tableView)
    }

    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let block = self.titleForHeaderInSectionBlock else { return nil }
        return block(tableView: tableView, section: section)
    }

    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let block = self.titleForFooterInSectionBlock else { return nil }
        return block(tableView: tableView, section: section)
    }


    // MARK: - Editing

    public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        guard let block = self.canEditRowAtIndexPathBlock else { return true }
        return block(tableView: tableView, indexPath: indexPath)
    }


    // MARK: - Moving/reordering

    public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        guard let block = self.canMoveRowAtIndexPathBlock else { return false }
        return block(tableView: tableView, canMoveRowAtIndexPath: indexPath)
    }

    public func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        guard let block = self.sectionIndexTitlesForTableViewBlock else { return nil }
        return block(tableView: tableView)
    }

    public func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        guard let block = self.sectionForSectionIndexTitleBlock else { return 0 }
        return block(tableView: tableView, sectionForSectionIndexTitle: title, atIndex: index)
    }


    // MARK: - Data manipulation - insert and delete support

    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let block = self.commitEditingStyleBlock else { return }
        block(tableView: tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    }

    public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        guard let block = self.moveRowAtIndexPathBlock else { return }
        block(tableView: tableView, moveRowAtIndexPath: sourceIndexPath, toIndexPath: destinationIndexPath)
    }

}
