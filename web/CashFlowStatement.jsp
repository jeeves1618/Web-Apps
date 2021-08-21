<%@page import="CommonModules.*"%>
<%@page import="CashFlowStatement.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Financial Statement</title>
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
		/*
        .split {
                height: 100%;
                width: 73.1%;
                position: fixed;
                z-index: 1;
                top: 0;
                overflow-x: hidden;
                padding-top: 2px;
                }

        .left {
        left: 0;
        background-color: #FCF3CF;
        padding: 5px;
        }

        .right {
        right: 0;
        width: 28.5%;
        text-align: right;
        padding: 5px;
        background-color:#EAFAF1;
        }
		/* Tooltip container */
		.tooltip {
		  position: relative;
		  display: inline-block;
		  border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
		}

		/* Tooltip text */
		.tooltip .tooltiptext {
		  visibility: hidden;
		  width: 320px;
		  background-color: white;
		  color: black;
		  text-align: center;
		  padding: 5px 0;
		  border-radius: 6px;
		 
		  /* Position the tooltip text - see examples below! */
		  position: absolute;
		  z-index: 1;
		}

		/* Show the tooltip text when you mouse over the tooltip container */
		.tooltip:hover .tooltiptext {
		  visibility: visible;
		}
		*/
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

    <%CashFlowCalculator CashFlowInstanceOne = new CashFlowCalculator("Two", "Sal1");%>
    <%CashFlowCalculator CashFlowInstanceTwo = new CashFlowCalculator("One", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
	
    <div>
        <h2 align=center>Cash Flow Statement</h2>
        
        <table border=1; align=center>
            <col width="1100"> 
            <col width="180"> 
          
            <tr><td align="center" colspan="2"><%= CashFlowInstanceOne.getTimePeriod()%></td></tr>
            <tr><td align="left" ><div class="tooltip">Beginning Cash Balance<span class="tooltiptext">Cash on hand at the start of the accounting period.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getBeginningCashBalance() + CashFlowInstanceTwo.getBeginningCashBalance()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
            <tr><td align="left" ><div class="tooltip">Cash Receipts<span class="tooltiptext">Also called collections or simply receipts come from collecting money from customers.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashReceipts() + CashFlowInstanceTwo.getCashReceipts()))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Cash Disbursements<span class="tooltiptext">Disbursement is writing a check to pay for the rent, for inventory, for supplies or salaries.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashDisbursements() + CashFlowInstanceTwo.getCashDisbursements()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Cash from Operations</b><span class="tooltiptext">Reports the flow of money into and out of business from making and selling of products. It is a good measure of how well a business is able to raise cash through operations</span></div></td>
                <td align="right"><b><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashReceipts() + CashFlowInstanceTwo.getCashReceipts() - CashFlowInstanceOne.getCashDisbursements() - CashFlowInstanceTwo.getCashDisbursements()))%></b></td></tr> 
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip">Fixed Asset Purchases<span class="tooltiptext">Expenses spent on fixed assets.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getFixedAssetPurchases() + CashFlowInstanceTwo.getFixedAssetPurchases()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Net Borrowings</b><span class="tooltiptext">Difference between the money lent and the money borrowed.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getNetBorrowings() + CashFlowInstanceTwo.getNetBorrowings()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
				<tr><td align="left" ><div class="tooltip">Income Taxes Paid <span class="tooltiptext">Taxes on Income. For this personal Networth History, this will be the taxes deducted at source.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((0)))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Sale of Stock<span class="tooltiptext">Incoming arising out of selling stocks. For this personal Networth History, this will be the income arising out of selling assets.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((CashFlowInstanceOne.getSaleProceeds() + CashFlowInstanceTwo.getSaleProceeds())*10))%></td></tr>
			
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Ending Cash Balance</b><span class="tooltiptext">Ending cash balance = Beginning cash balance + cash received - cash spent</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getEndingCashBalance() + CashFlowInstanceTwo.getEndingCashBalance()))%></td></tr>
		</table>
			<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
				<tr><td align="center"><a href="http://localhost:8080/FinancialStatements/" class="button button2">Balance Sheet</a></td>
					<td align="center"><a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp" class="button button2">Networth History</a></td>
					<td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
					<td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
					<td align="center"><a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
				</tr>
				<tr><td align="center" colspan="3"><a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
					<td align="center" colspan="2"><a href="http://localhost:8080/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
				</tr>
         </table>  

    </div> 
	
</body>
</html>