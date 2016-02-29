UPDATE [SysproCompanyT].[dbo].[PorMasterDetail]
   SET [MReceivedQty] = <MReceivedQty, decimal(10,3),>
      ,[MCompleteFlag] = <MCompleteFlag, char(1),>
      ,[MGlCode] = <MGlCode, char(15),>
 WHERE PurchaseOrder = ''
GO


