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
        500.0 - expenses.reduce(0) { $0 + $1.amount }
    }
    
    var budgetColor: Color {
        remainingBudget >= 0 ? .green : .red
    }
    
    func addExpense(name: String, amount: Double) {
        let newExpense = Expense(name: name, amount: amount)
        expenses.append(newExpense)
    }
    
    func removeExpense(expense: Expense) {
        guard let index = expenses.firstIndex(of: expense) else { return }
        expenses.remove(at: index)
    }
}
