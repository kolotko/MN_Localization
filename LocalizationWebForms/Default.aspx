<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LocalizationWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background-color: #f1f1f1;
        }
        .languageSection {
            max-width: 300px;
        }
        
        .flagContainer {
                width: 210px;
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .flagIconPL {
            width: 46px;
            height: 30px;
            display: block;
            background-image: url('/Images/flaga_polski.png');
            background-size: contain;
            background-repeat: no-repeat;
            border: none;
        }
        
        .flagIconEN {
            width: 46px;
            height: 30px;
            display: block;
            background-image: url('/Images/flaga_angli.png');
            background-size: contain;
            background-repeat: no-repeat;
            border: none;
        }
        
        .flagIconDE {
            width: 46px;
            height: 30px;
            display: block;
            background-image: url('/Images/flaga_niemiec.png');
            background-size: contain;
            background-repeat: no-repeat;
            border: none;
        }
        
        .calendarContainer {
            margin-bottom: 10px;
        }
        
        .timePickerContainer {
            margin-bottom: 10px;
        }
    </style>
    <script>
        function SetLanguageCookie(selectedLanguage) {
          var expDate = new Date();
          expDate.setDate(expDate.getDate() + 365); // Expiration 365 days from today
          document.cookie = "langCookie=" + selectedLanguage + "; expires=" + expDate.toUTCString() + "; path=/";
        }
    </script>
    <main>
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
                <section class="languageSection">
                    <div class="flagContainer">
                        <asp:Button ID="btnPolish" runat="server" OnClientClick="SetLanguageCookie('pl')" CausesValidation="false" CssClass="flagIconPL" />
                        <asp:Button ID="btnEnglish" runat="server" OnClientClick="SetLanguageCookie('en')" CausesValidation="false" CssClass="flagIconEN" />
                        <asp:Button ID="btnDeuchland" runat="server" OnClientClick="SetLanguageCookie('de')" CausesValidation="false" CssClass="flagIconDE" />
                    </div>
                    
                    <div class="calendarContainer">
                        <asp:Calendar id="calendar" runat="server">
                            <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>
                            <TitleStyle BackColor="LightGray" ForeColor="White"></TitleStyle>
                            <DayStyle BackColor="LightGray"></DayStyle>
                            <SelectedDayStyle BackColor="LightGray" Font-Bold="True"></SelectedDayStyle>
                        </asp:Calendar>
                    </div>
                    <div class="timePickerContainer">
                        <asp:TextBox ID="timePicker" runat="server" TextMode="Time"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button ID="buttonCheck" runat="server" OnClick="OnClick" meta:resourcekey="buttonCheckResource"/>
                    </div>
                </section>
                <section>
                    <asp:Label ID="labelTitleResult" runat="server"></asp:Label>
                    <br>
                    <asp:Label ID="labelResult" runat="server"></asp:Label>
                    <br>
                    <asp:Label ID="labelFooterResult" runat="server"></asp:Label>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>
    </main>

</asp:Content>
