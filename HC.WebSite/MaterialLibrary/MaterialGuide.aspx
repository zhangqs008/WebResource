﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialGuide.aspx.cs"
    Inherits="HC.WebSite.MaterialLibrary.MaterialGuide" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <style type="text/css">
        .toolTips { width: 80px; height: 80px; }
    </style>
    <div id="left_guide_title">
        网页素材库<span class="tip">操作提示</span>
    </div>
    <div id="left_guide_content">
        <div class="mainContent">
            <ul id="fileList" class="filetree" style="margin-left: 10px;">
                <%= FileTreeHtml %></ul>
            <%--上下文菜单--%>
            <div class="contextMenu" id="folderMenu">
                <ul>
                    <li id="preview">
                        <img style="width: 18px; height: 16px;" src="<%=BasePath %>Scripts/jquery.treeview/images/eye.png"
                            alt="" />
                        预览</li>
                    <li id="downLoad">
                        <img style="width: 18px; height: 16px;" src="<%=BasePath %>Scripts/jquery.treeview/images/page_white_put.png"
                            alt="" />
                        下载</li>
                </ul>
            </div>
            <div class="contextMenu" id="fileMenu">
                <ul>
                    <li id="filePreview">
                        <img style="width: 18px; height: 16px;" src="<%=BasePath %>Scripts/jquery.treeview/images/eye.png"
                            alt="" />
                        预览</li>
                    <li id="fileCode">
                        <img style="width: 18px; height: 16px;" src="<%=BasePath %>Scripts/jquery.treeview/images/page_white_put.png"
                            alt="" />
                        源码</li>
                </ul>
            </div>
            <script type="text/javascript">
                $(function () {

                    //操作提示
                    $(".tip").click(function () {
                        mask(true);
                        $.dialog({
                            title: "使用帮助",
                            content: 'url:<%=BasePath %>Demo/index.htm',
                            width: 860,
                            height: 490,
                            close: function () { mask(false); }
                        });
                    });

                    //树形文件目录
                    $(".filetree").treeview({
                        animated: "fast",
                        collapsed: true
                    });

                    $(".folder").eq(0).trigger("click");
                    //显示ToolTips
                    $(document).tooltip({
                        items: ".file",
                        track: true,
                        content: function () {
                            var element = $(this);
                            var name = element.attr("name");
                            var img = element.attr("img");
                            if (img != "") {
                                return "<img class='toolTips' alt='" + name + "' src='" + img + "'>";
                            }
                            return "";
                        }
                    });
              
                    //响应右键菜单
                    $('.folder').contextMenu('folderMenu', {
                        bindings: {
                            'preview': function (t) {
                                var path = "<%=BasePath %>MaterialLibrary/MaterialPreview.aspx?path=" + encodeURIComponent($(t).attr("path"));
                                var url = path;
                                var temp = parent.document.getElementById("right");
                                temp.src = url;
                                temp.contentWindow.window.name = "right";
                                parent.frames["right"] = temp.contentWindow.window;
                            },
                            'downLoad': function (t) {
                                var url = "<%=BasePath %>MaterialLibrary/MaterialDownLoad.aspx?path=" + $(t).attr("path");
                                var temp = parent.document.getElementById("right");
                                temp.src = url;
                                temp.contentWindow.window.name = "right";
                                parent.frames["right"] = temp.contentWindow.window;
                            },
                            'delete': function (t) {

                            }
                        }
                    });
                });

                function GetRandomNum() {
                    var range = 1000;
                    var rand = Math.random();
                    return (Math.round(rand * range));
                }
            </script>
        </div>
    </div>
    </form>
</body>
</html>
