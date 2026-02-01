//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = BudgetViewModel()
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    // MARK: - Budget Header
                    Text("Budget Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Remaining Budget: \(viewModel.remainingBudget, format: .currency(code: "USD"))")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(viewModel.budgetColor)
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Add Expense Form
                VStack(spacing: 15) {
                    
                    TextField("Expense name", text: $expenseName)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Amount", text: $expenseAmount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        let name = expenseName.trimmingCharacters(in: .whitespacesAndNewlines)
                        let amountText = expenseAmount.trimmingCharacters(in: .whitespacesAndNewlines)
                        if let amount = Double(amountText), !name.isEmpty {
                            viewModel.addExpense(name: name, amount: amount)
                            expenseName = ""
                            expenseAmount = ""
                        }
                    } label: {
                        Text("Add Expense")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                            .foregroundStyle(.white)
                        
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Expenses List
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expenses")
                        .font(.headline)
                    
                    if viewModel.expenses.isEmpty {
                        Text("No expenses yet")
                            .foregroundStyle(.secondary)
                    }
                    
                    ForEach($viewModel.expenses) { $expense in
                        NavigationLink {
                            ExpenseDetailView(expense: $expense, viewModel: viewModel)
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(expense.name)
                                        .fontWeight(.semibold)
                                    Text(expense.amount, format: .currency(code: "USD"))
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Button {
                                    viewModel.removeExpense(expense: expense)
                                } label: {
                                    Text("delete")
                                        .foregroundStyle(.red)
                                }
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Budget Tracker")
    }
}

#Preview {
    ContentView()
}
