Imports Core.Modules.Globals
'The namespace must be the same namespace that the DBML file is generated in (I.E: Data)
Namespace Data
    ' Partial Class Implementation for Customer Entity
    Partial Public Class Customer

        ' Returns an IQueryable(Of Customer) containing all DB fields in Ascending order by Name whose Active field is set to True.  
        ' Optionally, pass it False to return all Customers, regardless of the status of the Active flag.  

        Public Shared Function GetCustomers(Optional ByVal Active As Boolean = True) As IQueryable(Of Customer)

            Dim db As WrightDataContext = New WrightDataContext(conStrBuilder.ConnectionString)
            Dim cust
            If Active Then
                cust = From c In db.Customers
                       Where c.Active = True
                       Order By c.Name
                       Select c
            Else
                cust = From c In db.Customers
                       Order By c.Name
                       Select c
            End If
            Return cust

        End Function
        ' Public function to create a new customer.  Takes a customer object as required parameter and will insert that record in the Database.
        Public Shared Function Create(cust As Customer) As Boolean
            Try
                Dim db As WrightDataContext = New WrightDataContext(My.Settings.Wright2015ConnectionString)
                Dim newCust = New Customer

                newCust.Address1 = cust.Address1
                newCust.Address2 = cust.Address2
                newCust.Address3 = cust.Address3
                newCust.City = cust.City
                newCust.State = cust.State
                newCust.PostalCode = cust.PostalCode
                newCust.Country = cust.Country
                newCust.Fax = cust.Fax
                newCust.PrimaryContact = cust.PrimaryContact
                newCust.ContactFax = cust.ContactFax
                newCust.ContactPhone = cust.ContactPhone
                newCust.ContactEmail = cust.ContactEmail
                newCust.APAccountNo = cust.APAccountNo
                newCust.DefaultPO = cust.DefaultPO
                newCust.PasswordOut = cust.PasswordOut
                newCust.BuyerName = cust.BuyerName
                newCust.BuyerNo = cust.BuyerNo
                newCust.PasswordIn = cust.PasswordIn
                newCust.Note = cust.Note


                db.Customers.InsertOnSubmit(cust)
                db.SubmitChanges()

                Return True

            Catch ex As Exception
                Throw ex
            End Try
        End Function
    End Class

End Namespace