UPDATE [MobileOrdering].[dbo].[ReceiveTickets]
   SET [TicketStatus] = 'New'
      ,[TicketUser] = 'None'
 WHERE PurchaseOrder = ''
GO


