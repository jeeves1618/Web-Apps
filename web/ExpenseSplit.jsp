<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.*"%>
<%@page import="admin.*"%>	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lifestyle Planner</title>
<link rel="stylesheet" href="FinancialManagementStyle.css">
<style>
body {
  margin: auto;
  width: 95%;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
topnav{
  text-align: center;
}
topnav ul{
  display: inline-block;
}
</style>
</head>
<body>

    <%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
    <%String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	  DecimalFormat ft = new DecimalFormat(currencyFormat);%>
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
                    ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() +
					ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses() +
					ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses() +
                    ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI());%>
	<%double nonDiscretionaryNonEMIExpenses = nonDiscretionaryExpenses - ExpenseInstanceOne.getMonthlyEMI() -ExpenseInstanceTwo.getMonthlyEMI();%>
    <div>
        <h2 align=center>Expense Split</h2>
        <div class="topnav">
		<a href="http://localhost:8080/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp">Payables</a>
		<a class="active" href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp">Receivables</a>
		<a href="http://localhost:8080/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeables</a>
		<a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8080/FinancialStatements/manageNLP.jsp">NLP</a>
		<a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8080/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Entries</a>
		</div>
		&nbsp;
        <table border=1; align=center>   
            <col width="572"> 
            <col width="80">
			<col width="572"> 
            <col width="80">
            <tr><td align="center" colspan="2"><b>Non Discretionary Expense Split</b></td> 
			    <td align="center" colspan="2"><b>Non Discretionary Non EMI Split</b></td></tr>
            <tr>
                <td align="left">Apartment Maintenance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Apartment Maintenance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Electricity Bill</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Electricity Bill</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Miscellaneous</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Miscellaneous</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Trading Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Trading Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            <tr>
                <td align="left">Insurance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Insurance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Cash Withdrawals</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Cash Withdrawals</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>

            <tr>
                <td align="left">Groceries</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Groceries</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Travel Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Travel Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
			
			<tr>
                <td align="left">Education Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Education Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
			
            <tr>
                <td align="left">Extended Family</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Extended Family</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Shopping Eat Outs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Shopping Eat Outs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>

            <tr>
                <td align="left">Entertainment</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Entertainment</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Domestic Help</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Domestic Help</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Home Loan EMIs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>
            
            <tr><td align="center" colspan="4"><b>Expenses - Key Ratios</b></td></tr>            
            
            <tr>
                <td align="left">Non Discretionary Vs Expense</td>
                <td align="right"><%= pc.format((nonDiscretionaryExpenses)/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
				<td align="left">Non EMI Vs Expense</td>
                <td align="right"><%= pc.format((nonDiscretionaryNonEMIExpenses)/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
            </tr>
            <tr>
                <td align="left">Non Discretionary Vs Income</td>
                <td align="right"><%= pc.format(nonDiscretionaryExpenses/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="left">Non EMI Vs Income</td>
                <td align="right"><%= pc.format(nonDiscretionaryNonEMIExpenses/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
            </tr>
            
            <tr>
                <td align="left">Discretionary Vs Expense</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments())/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>

            <tr>
                <td align="left">Discretionary vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>
            
            <tr>
                <td align="left">Expenses vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalExpenses() + ExpenseInstanceTwo.getTotalExpenses())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>

            <tr>
                <td align="left">Savings vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalSavings() + ExpenseInstanceTwo.getTotalSavings())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>
            
        </table>
    </div>
    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    </div>
</body>
</html>