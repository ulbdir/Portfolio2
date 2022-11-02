//
//  TransactionGroup.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 01.11.22.
//

import Foundation

enum TransactionGroupBy: String {
    case None = "None"
    case Day = "Day"
    case Week = "Week"
    case Month = "Month"
    case Year = "Year"
}

/**
 * Groups transactions for display in TransactionListView
 */
struct TransactionGroup: Identifiable {
    let id = UUID()
    var title: String
    var transactions: [Transaction]
    
    private static func isSameGroup(txs: [Transaction], new_tx: Transaction, groupBy: TransactionGroupBy) -> Bool {
        switch (groupBy) {
        case .None:
            if txs.isEmpty {
                return true
            } else {
                return false
            }
        case .Day:
            if (txs.isEmpty) {
                return true
            } else {
                let dc1 = Calendar.current.dateComponents([.year, .month, .day], from: txs[0].date)
                let dc2 = Calendar.current.dateComponents([.year, .month, .day], from: new_tx.date)
                if (dc1.year == dc2.year && dc1.month == dc2.month && dc1.day == dc2.day) {
                    return true
                } else {
                    return false
                }
            }
        case .Week:
            if (txs.isEmpty) {
                return true
            } else {
                let dc1 = Calendar.current.dateComponents([.year, .weekOfYear], from: txs[0].date)
                let dc2 = Calendar.current.dateComponents([.year, .weekOfYear], from: new_tx.date)
                if (dc1.year == dc2.year && dc1.weekOfYear == dc2.weekOfYear) {
                    return true
                } else {
                    return false
                }
            }
        case .Month:
            if (txs.isEmpty) {
                return true
            } else {
                let dc1 = Calendar.current.dateComponents([.year, .month], from: txs[0].date)
                let dc2 = Calendar.current.dateComponents([.year, .month], from: new_tx.date)
                if (dc1.year == dc2.year && dc1.month == dc2.month) {
                    return true
                } else {
                    return false
                }
            }
        case .Year:
            if (txs.isEmpty) {
                return true
            } else {
                let dc1 = Calendar.current.dateComponents([.year], from: txs[0].date)
                let dc2 = Calendar.current.dateComponents([.year], from: new_tx.date)
                if (dc1.year == dc2.year) {
                    return true
                } else {
                    return false
                }
            }

        }
    }
    
    private static func getGroupTitle(transactions: [Transaction], groupBy: TransactionGroupBy) -> String {
        switch groupBy {
        case .Week:
            // return week, month and year of first transaction
            let f = DateFormatter()
            f.dateFormat = "'Week' ww yyyy"
            return f.string(for: transactions[0].date) ?? "week"
        case .Month:
            // return month and year of first transaction
            let f = DateFormatter()
            f.dateFormat = "LLLL yyyy"
            return f.string(for: transactions[0].date) ?? "month"
        case .Year:
            // return year of first transaction
            let f = DateFormatter()
            f.dateFormat = "yyyy"
            return f.string(for: transactions[0].date) ?? "year"
        default:
            // return full date of the first transaction
            return transactions[0].date.formatted(date: .abbreviated, time: .omitted)

        }
    }
    
    static func computeTransactionGroups(transactions: [Transaction], groupBy: TransactionGroupBy) -> [TransactionGroup] {
        var result: [TransactionGroup] = []
        
        var currentTxs: [Transaction] = []
        
        for tx in transactions.sorted(by: { a, b in a.date > b.date}) {
            if (isSameGroup(txs: currentTxs, new_tx: tx, groupBy: groupBy)) {
                currentTxs.append(tx)
            } else {
                result.append(TransactionGroup(title: getGroupTitle(transactions: currentTxs, groupBy: groupBy), transactions: currentTxs))
                currentTxs = [tx]
            }
        }
        
        if (!currentTxs.isEmpty) {
            result.append(TransactionGroup(title: getGroupTitle(transactions: currentTxs, groupBy: groupBy), transactions: currentTxs))
        }
        
        return result
    }
    
}
