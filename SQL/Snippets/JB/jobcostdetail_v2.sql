SELECT Job.Job 
	,Job.Status 
	,Job_Operation.Sequence 
	,Job_Operation.Rwk_Run_Labor 
	,Job_Operation.Rwk_Setup_Labor 
	,Job_Operation.Rwk_Setup_Labor_Hrs 
	,Job_Operation.Rwk_Run_Labor_Hrs 
	,Job_Operation.Rwk_Scrap_Qty 
	,Job_Operation.Rwk_Quantity 
	,Job_Operation.Operation_Service 
	,Job_Operation.Description 
	,Job_Operation.Rem_Run_Hrs 
	,Job_Operation.Rem_Setup_Hrs 
	,Job_Operation.WC_Vendor 
	,Job_Operation.Status AS JOStatus 
	,Job_Operation.Act_Setup_Labor 
	,Job_Operation.Act_Run_Labor 
	,Job_Operation.Est_Setup_Labor 
	,Job_Operation.Est_Run_Labor 
	,Job_Operation.Job_Operation 
	,Job_Operation.Attended_Pct 
	,Job_Operation.Est_Setup_Hrs 
	,Job_Operation.Act_Setup_Labor_Hrs 
	,Job_Operation.Est_Run_Hrs 
	,Job_Operation.Act_Run_Labor_Hrs 
	,Job_Operation.Act_Run_Qty 
	,Job_Operation.Act_Scrap_Qty 
	,Job_Operation.Work_Center 
	,0 AS Setup_Labor_Rate 
	,0 AS Run_Labor_Rate 
	,Q1.Work_Date 
	,Q1.First_Name + ' ' + CASE  
		WHEN NOT Q1.Middle_Initial IS NULL 
			THEN Q1.Middle_Initial + ' ' 
		ELSE '' 
		END + Q1.Last_Name AS Emp_Name 
	,CASE  
		WHEN NOT Q1.nSetupHrs IS NULL 
			THEN Q1.nSetupHrs 
		ELSE 0 
		END AS nSetupHrs 
	,CASE  
		WHEN NOT Q1.nActHrs IS NULL 
			THEN Q1.nActHrs 
		ELSE 0 
		END AS nActHrs 
	,CASE  
		WHEN NOT Q1.nRunQty IS NULL 
			THEN Q1.nRunQty 
		ELSE 0 
		END AS nRunQty 
	,CASE  
		WHEN NOT Q1.nScrapQty IS NULL 
			THEN Q1.nScrapQty 
		ELSE 0 
		END AS nScrapQty 
FROM Job 
INNER JOIN ( 
	Job_Operation LEFT JOIN ( 
		SELECT Job_Operation_Time.Job_Operation 
			,Employee.First_Name 
			,Employee.Middle_Initial 
			,Employee.Last_Name 
			,Sum(Job_Operation_Time.Act_Setup_Labor_Hrs) AS nSetupHrs 
			,Sum(Job_Operation_Time.Act_Run_Labor_Hrs) AS nActHrs 
			,Sum(Job_Operation_Time.Act_Run_Qty + Job_Operation_Time.Act_Setup_Qty) AS nRunQty 
			,Sum(Job_Operation_Time.Act_Scrap_Qty) AS nScrapQty 
			,Job_Operation_Time.Rework_Time 
			,Job_Operation_Time.Work_Date 
		FROM Employee 
		INNER JOIN Job_Operation_Time ON Employee.Employee = Job_Operation_Time.Employee 
		GROUP BY Job_Operation_Time.Job_Operation 
			,Employee.Employee 
			,Employee.First_Name 
			,Employee.Middle_Initial 
			,Employee.Last_Name 
			,Job_Operation_Time.Rework_Time 
			,Job_Operation_Time.Work_Date 
		) AS Q1 ON Job_Operation.Job_Operation = Q1.Job_Operation 
	) ON Job.Job = Job_Operation.Job 
WHERE Job.Job = '1506114' 
	AND Job_Operation.Inside_Oper <> 0  
ORDER BY Job_Operation.Sequence 
