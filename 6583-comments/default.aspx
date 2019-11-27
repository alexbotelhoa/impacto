<%@ Page Language="VB"%>
<%@ Import Namespace="System.Web.Mail" %>

<script language="VB" runat="server">
Sub enviar_OnClick(Source As Object, E As EventArgs)
Dim objMail As New MailMessage

Dim uName As String
Dim uEmail As String
Dim uComment As String

If Page.IsValid() Then
uName = name.Text
uEmail = email.Text
uComment = comment.Text

objMail.From = uEmail
objMail.To = "almeidabatista@uol.com.br"
objMail.Subject = "Comentários de " & uName
'objMail.BodyFormat = MailFormat.HTML
objMail.Body = "<font face=verdana size=2>" & uComment & "</font>"
enviado.Text = "Sua mensagem foi enviada ao administrador."
SMTPMail.Send(objMail)

End If
End Sub
</script>
<html>
<head>
<title>fale com o webmaster</title>
</head>
<body>
<form method="post" runat="server">
<asp:Label id="enviado" text="Envie um e-mail para o administrador:" runat="server" />
<table>
<TR><TD ALIGN=RIGHT>
<B>Nome:</B>
</TD><TD>
<asp:Textbox id="name" runat="server" size="50" />
</TD><TD>
<!--
Esta linha a seguir é um componente do ASP.NET que verifica se o campo foi preenchido corretamente.
-->
<asp:RequiredFieldValidator runat="server"
id="reqName" ControlToValidate="name"
ErrorMessage = "Você deve fornecer seu nome!"
display="Dynamic" />
</TD></TR>
<TR><TD ALIGN=RIGHT>
<B>Email:</B>
</TD><TD>
<asp:TextBox id="email" size="50" runat="server" />
</TD><TD>
<!--
Esta linha a seguir é um componente do ASP.NET que verifica se o campo foi preenchido corretamente.
-->
<asp:RequiredFieldValidator runat="server"
id="validEmailRequired" ControlToValidate="email"
errormessage="Por favor entre com seu endereço de e-mail."
display="Dynamic" />
</TD></TR>
<TR><TD ALIGN=RIGHT>
<B>Comentário:</B>
</TD><TD>
<asp:TextBox id="comment" TextMode="MultiLine" Rows="5" Columns="30" runat="server" />
</TD><TD>
</TD></TR>
<TR><TD COLSPAN=3 ALIGN=CENTER>
<asp:Button id="enviar" text="Enviar" OnClick="enviar_OnClick" runat="server" />
</TD></TR>
</table>
</form>
</body>
</html>