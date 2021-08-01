<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Payables</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: FloralWhite;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
		.button {
				  border: none;
				  color: white;
				  padding: 2px 2px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				  font-size: medium;
				  margin: 0px 0px;
				  transition-duration: 0.4s;
				  cursor: pointer;
				 }
		.button2 {
					background-color: Snow;
					color: black;
					border: 2px solid #008CBA;
				}
		.button2:hover {
					background-color: SlateGray;
					color: white;
				}
    </style>

    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
	<%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
    <%double nonDiscretionaryExpenses = (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance() + 
                    ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill() +
                    ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill() +
                    ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance() +
                    ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance() +
                    ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals() +
                    ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses() +
                    ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense() +
                    ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses() + 
                    ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense() + 
                    ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses() + 
					ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses() +
                    ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() +
					ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses() +
                    ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI());%>
    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    <div>
        <h2 align=center>Account Payables</h2>
        <table border=1; align=center>
            <col width="471"> 
            <col width="180"> 
            <col width="471"> 
            <col width="180">  
            <tr><td align="right" colspan="4"><b><%= ExpenseInstanceOne.getTimePeriod()%></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp" class="button button2">Yearly View</button></td></tr>
            <tr><td align="center" colspan="2"><b>Ben - Monthly Summary</b></td>
                <td align="center" colspan="2"><b>Bun - Monthly Summary</b></td></tr>
                        
            <tr><td align="left" >Ben Income</td>
                <td align="right"><%= ExpenseInstanceOne.getTotalIncomeFmtd()%></td>
                <td align="left" >Bun Income</td>
                <td align="right"><%= ExpenseInstanceTwo.getTotalIncomeFmtd()%></td>
            </tr>
            
            <tr><td align="left" >Ben Expenses</td>
                <td align="right"><%= ExpenseInstanceOne.getTotalExpensesFmtd()%></td>
                <td align="left" >Bun Expenses</td>
                <td align="right"><%= ExpenseInstanceTwo.getTotalExpensesFmtd()%></td>
            </tr>

            <tr><td align="left" >Ben Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalIncome() - ExpenseInstanceOne.getTotalExpenses()))%></td>
                <td align="left" >Bun Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceTwo.getTotalIncome() - ExpenseInstanceTwo.getTotalExpenses()))%></td>
            </tr>

            <tr><td align="center" colspan="2"><b>Monthly Income Split</b></td>
                <td align="center" colspan="2"><b>Monthly Expense Split</b></td></tr>
                        
            <tr><td align="left" >Salary Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getSalaryIncome() + ExpenseInstanceTwo.getSalaryIncome()))%></td>
                <td align="left" >Apartment Maintenance</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance()))%></td>
            </tr>

            <tr><td align="left" >Interest Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome()))%></td>
                <td align="left" >Electricity Bill</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill()))%></td>
            </tr>
                        
            <tr><td align="left" >Dividend Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getDividendIncome() + ExpenseInstanceTwo.getDividendIncome()))%></td>
                <td align="left" >Amazon Purchases and Miscellaneous</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill()))%></td>
            </tr>

            <tr><td align="left" >Rental Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getRentalIncome() + ExpenseInstanceTwo.getRentalIncome()))%></td>
                <td align="left" >Trading Expenses</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance()))%></td>
            </tr>
                        
            <tr><td align="left" >Maturity of Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getSaleProceeds() + ExpenseInstanceTwo.getSaleProceeds()))%></td>
                <td align="left" >Home, Car, Personal Insurance</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance()))%></td>
            </tr>

            <tr><td align="left" >Capital Gains</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCapitalGains()))%></td>
                <td align="left" >Cash Withdrawals</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals()))%></td>
            </tr>
                        
            <tr><td align="left" >Monetary Gifts</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonetaryGifts()))%></td>
                <td align="left" >Groceries</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Car Maintenance and Travel Expenses</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Extended Family Care</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Shopping and Eat Outs</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Entertainment and Connectivity</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Education, Laptop, Accessories</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Domestic Help</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Home Improvement</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Home Loan EMIs</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Books outside of Work</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getdLearningExpenses() + ExpenseInstanceTwo.getdLearningExpenses()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Healthcare and Fitness</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><b>Discretionary Spending</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments() + ExpenseInstanceOne.getdLearningExpenses() + ExpenseInstanceTwo.getdLearningExpenses()))%></td>
            </tr>
            
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Non Discretionary Spending</td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses))%>
                </td>
            </tr>
            <tr><td align="left" ><b>Total Income </b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(
                    ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()
                ))
                    %></td>
                <td align="left" ><b>Total Expenses</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalExpenses() + ExpenseInstanceTwo.getTotalExpenses()))%>
                </td>
            </tr>
			</table>
            <table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">  
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp" class="button button2">Income Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
        </table>
    </div>
</body>
</html>