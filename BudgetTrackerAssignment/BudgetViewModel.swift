//
//  BudgetViewModel.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

@Observable class BudgetViewModel {
    var expenses: [Expense] = []
    
    var remainingBudget: Double {
        var balance: Double = 500.0
        for expense in expenses {
            balance -= expense.amount
        }
        return balance
    }
    
    var budgetColor: Color {
        if remainingBudget >= 0 {
            return .green
        }
        return .red
    }
    
    func addExpense(name: String, amount: Double) {
        expenses.append(Expense(name: name, amount: amount))
    }
    
    func removeExpense(expense: Expense) {
        if let index = expenses.firstIndex(of: expense) {
            expenses.remove(at: index)
        }
    }
}
