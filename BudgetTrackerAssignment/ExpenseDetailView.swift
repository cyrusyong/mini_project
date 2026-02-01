//
//  ExpenseDetailView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

struct ExpenseDetailView: View {
    @Binding var expense: Expense
    @State var viewModel: BudgetViewModel
    
    var body: some View {
        List {
            Section(header: Text("Expense Info")) {
                TextField("Name", text: $expense.name)

                TextField("Amount", value: $expense.amount, format: .number)
                    .keyboardType(.decimalPad)
            }
            
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


#Preview {
    ExpenseDetailView(expense: .constant(Expense(name: "Pizza", amount: 56.34)), viewModel: BudgetViewModel())
}
