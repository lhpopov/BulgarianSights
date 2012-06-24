<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BulgarianSights._Default" %>



<%@ Register src="AddSiteControl.ascx" tagname="AddSiteControl" tagprefix="uc1" %>
<%@ Register src="~/ViewSiteList.ascx" tagname="ViewSiteListControl" tagprefix="uc1" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">  
    <link href="scripts/openlayers/theme/default/style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/MapStyle.css" rel="stylesheet" type="text/css" />
    <script src="scripts/onLoadMap.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        $("#NavigationMenu li a")[0].style.background = '#bfcbd6';
        $("#NavigationMenu li a")[0].style.color = '#465c71';
        $("#NavigationMenu li a")[0].style.textDecoration = 'none';

        function loadInfo(href) {
            $("#blaQ").load(href); //, function () { $(this).ready(function () { bla(); }) });
        }

        function getCoordsClick() {
            var coords = $('#LabelCoords').html();
            coords = coords.split(',');
            $('#siteX').val(coords[0]);
            $('#siteY').val(coords[1]);
        }

        function showAddForm() {
            var addSiteWidth = $('#addSite').width() + 10;
            var mapWidth = $('#map').width();

            if ($("#viewSite").css('display') != 'none') {
                $('#viewSite').animate({
                    opacity: 0
                }, 300).css('display', 'none');

                addSiteWidth = 0;
            }

            if ($('#addSite').css('display') == 'none') {
                $('#addSite').css('opacity', '0');
                $('#addSite').css('display', 'block');
                $('#map').animate({
                width: mapWidth - addSiteWidth + 'px'
                }, 'slow', function(){
                    $('#addSite').animate({ opacity: 1, height: height }, 'slow');
                });


            }
            else {
                $('#addSite').animate({
                    opacity: 0
                }, 300, function () {
                    $('#map').animate({ width: '100%' }, 300);
                    $(this).css('display', 'none')
                }) ;

                
            }
        }

        function showViewForm() {
            var addSiteWidth = $('#addSite').width() + 10;
            var mapWidth = $('#map').width();
            var mapHeight = $('#map').height();

            if ($("#addSite").css('display') != 'none') {
                $('#addSite').animate({
                    opacity: 0
                }, 300).css('display', 'none');

                addSiteWidth = 0;
            }

            if ($('#viewSite').css('display') == 'none') {
                $('#viewSite').css('opacity', '0');
                $('#viewSite').css('display', 'block');
                $('#map').animate({
                    width: mapWidth - addSiteWidth + 'px'
                }, 'slow', function () {
                    $('#viewSite').animate({ opacity: 1, height: mapHeight }, 'slow');
                });


            }
            else {
                $('#viewSite').animate({
                    opacity: 0
                }, 300, function () {
                    $('#map').animate({ width: '100%' }, 300);
                    $(this).css('display', 'none')
                });


            }
        }
    </script>

    <div id="map" onclick="getCoordsClick()" runat="server" clientidmode="static">
    </div>

    <script type="text/javascript">
        var header = 120;   
        var footer = 40;
        var height = $(window).height() - header - footer + 'px';
        var minheight = $("#map").css('min-height');

        if (height < minheight) {
            height = minheight;
        }
        $("#map").css('height', height);
    </script>

    <div id="addSite" runat="server" clientidmode="Static">
        <uc1:AddSiteControl ID="AddSiteControl1" runat="server" ClientIDMode="Static"/>
        <%--<uc1:ViewSiteListControl ID="ViewSiteListControl" runat="server" ClientIDMode="Static"/>--%>
    </div>

     <div id="viewSite" runat="server" clientidmode="Static">
        <uc1:ViewSiteListControl ID="ViewSiteListControl" runat="server" ClientIDMode="Static"/>
    </div>

    <div id="LabelCoords" style="width: auto; background: white; color: black;">
    </div>



<asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Always">
    <ContentTemplate>

    <asp:GridView ID="GridViewEventObjects" runat="server" style="display: none;" ClientIDMode="Static">
    </asp:GridView>

    <asp:GridView ID="GridViewDocObjects" runat="server" style="display: none;" ClientIDMode="Static">
    </asp:GridView>

    <asp:GridView ID="GridViewSiteObjects" runat="server" style="display: none;" ClientIDMode="Static">
    </asp:GridView>

    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


