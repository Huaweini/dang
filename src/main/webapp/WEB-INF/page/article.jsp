<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/14
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>党史学习网站后台管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function addFrom() {
            //临时法
            $("input[name='id']").val(null);
            $("input[name='realName']").val(null);
            $("input[name='loginName']").val(null);
            $("input[name='grade']").val(null);
            $("input[name='classNum']").val(null);
            $("input[name='age']").val(null);
            $("select[name='sex']").val(null);
        }
        
        function addUser() {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/addUser",
                data: $('#saveForm').serializeArray(),
                type: "post",
                dataType: "json",
                success: function (res) {
                    window.alert('添加成功:)')
                    window.location.reload()
                }
            }
            $.ajax(ajax)
        }

        function editPage(id) {
            var ajax = {
                url: "${pageContext.request.contextPath}/article/editArticleList",
                data: {
                    "id": id
                },
                type: "post",
                dataType: "json",
                success: function (res) {
                    $("input[name='id']").val(res.id);
                    $("input[name='title']").val(res.title);
                    $("#content").val(res.content);
                }
            }
            $.ajax(ajax)
        }

        function edit() {
            var ajax = {
                url: "${pageContext.request.contextPath}/article/editArticle",
                data: $('#saveForm1').serializeArray(),
                type: "post",
                dataType: "json",
                success: function (res) {
                    window.alert('修改成功:)')
                    window.location.reload()
                }
            }
            $.ajax(ajax)
        }

        function del(id) {
            if (confirm("确定删除?")) {
                var ajax = {
                    url: "${pageContext.request.contextPath}/article/delArticle",
                    data: {
                        "id": id
                    },
                    type: "post",
                    dataType: "json",
                    success: function (res) {
                        window.alert('删除成功:)')
                        window.location.reload()
                    }
                }
                $.ajax(ajax)
            }
        }

        function searchUser() {
            $("#pageNum").val(0);
            $("#searchForm").submit();
        }
    </script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">党史学习网站后台管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
<%--                <li><a href="#">登陆</a></li>--%>
<%--                <li><a href="#">退出</a></li>--%>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" style="margin-top: 80px;background-color: #b3b4b524">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="${pageContext.request.contextPath}/article/index">模块管理 <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/article/article">文章管理</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-top: -96px">
            <div class="row">
                <h2 class="sub-header" style="margin-left: 10px">文章管理</h2>
            </div>
            <div class="row">
                <div class="col-sm-12 table-responsive" style="margin-top: 10px;">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>文章标题</th>
                            <th>文章内容</th>
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="t" items="${list}" varStatus="status">
                            <tr>
                                <td>${t.title}</td>
                                <td style="width: 30%">${t.content}</td>
                                <td>
                                    <!-- 按钮触发模态框 -->
                                    <button type="button" class="btn btn-info" onclick="editPage(${t.id})"
                                            data-toggle="modal" data-target="#myModal1">修改
                                    </button>
                                    <button type="button" class="btn btn-danger" onclick="del(${t.id})">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!--修改页面-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">修改</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <form id="saveForm1">
                        <table class="table table-striped">
                            <!--id-->
                            <input type="hidden" name="id"/>
                            <tr>
                                <td>文章标题</td>
                                <td><input name="title" type="text" class="title"/></td>
                            </tr>
                            <tr>
                                <td>文章内容</td>
                                <td><textarea id="content" name="content"></textarea></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="edit()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
