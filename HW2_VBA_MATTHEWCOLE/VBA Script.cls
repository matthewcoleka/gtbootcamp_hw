VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub VBA_HW()

For Each ws In Worksheets
    
    Dim WorksheetName As String
    Dim Letter As String
    Dim Volume_Total As Double
    
    Volume_Total = 0
    
    Dim Summary_Table_Row As Integer
    Summary_Table_Row = 2
    
    
    lastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
    
    WorksheetName = ws.Name
    
    Letter = WorksheetName
    
    ws.Range("I1").Value = "Ticker"
    ws.Range("J1").Value = "Volume Total"
    
    For i = 2 To lastRow
        
        If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
            
            Letter = ws.Cells(i, 1).Value
            
            Volume_Total = Volume_Total + ws.Cells(i, 7).Value
            
            ws.Range("I" & Summary_Table_Row).Value = Letter
            
            ws.Range("J" & Summary_Table_Row).Value = Volume_Total
            
            Summary_Table_Row = Summary_Table_Row + 1
            
            Volume_Total = 0
        Else
        
            Volume_Total = Volume_Total + ws.Cells(i, 7).Value
            
        End If
    
    Next i

Next ws

MsgBox ("Sheets Complete")

        

End Sub

