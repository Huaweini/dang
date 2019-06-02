<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/14
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>育才中学后台管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <script type="text/javascript">
        function addFrom() {
            // console.log('addFromReady');
            //临时法
            $("input[name='id']").val(null);
            $("input[name='realName']").val(null);
            $("input[name='loginName']").val(null);
            $("input[name='grade']").val(null);
            $("input[name='classNum']").val(null);
            $("input[name='age']").val(null);
            $("select[name='sex']").val(null);
            $("select[name='project']").val(null);
            $("select[name='rank']").val(null);
            $("select[name='unit']").val(null);
        }
        function addTeacher() {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/addTeacher",
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

        function del(id) {
            if (confirm("确定删除?")){
            var ajax = {
                url: "${pageContext.request.contextPath}/user/delTeacher",
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

        function editPage(id) {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/editTeacherList",
                data: {
                    "id": id
                },
                type: "post",
                dataType: "json",
                success: function (res) {
                    $("input[name='id']").val(res.id);
                    $("input[name='realName']").val(res.realName);
                    $("input[name='loginName']").val(res.loginName);
                    $("select[name='classNum']").val(res.classNum);
                    $("input[name='age']").val(res.age);
                    $("select[name='sex']").val(res.sex);
                    $("select[name='project']").val(res.project);
                    $("select[name='rank']").val(res.rank);
                    $("select[name='unit']").val(res.unit);
                }
            }
            $.ajax(ajax)
        }

        function edit() {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/editTeacher",
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

        function searchTeacher() {
            $("#pageNum").val(0);
            $("#searchForm").submit();
        }

        function myLeader(unit) {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/myLeader",
                data: {"unit": unit},
                type: "post",
                dataType: "json",
                success: function (res) {
                    console.log(res)
                    var value = "";
                    for (var i = 0;i<res.length;i++){
                        value += "<tr>";
                        value += "<td>" + res[i].realName + "</td>";
                        value += "<td>" + res[i].unit + "</td>";
                        value += "</tr>";
                    }
                    $(".myLeader").html(value);
                }
            }
            $.ajax(ajax)
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
            <a class="navbar-brand" href="#">育才中学后台管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">登陆</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" style="margin-top: 80px;background-color: #b3b4b524">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="${pageContext.request.contextPath}/user/page">学生管理 <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/teacherPage">教师管理</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        组织结构 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/unit/classConfigPage">班级-结构管理</a></li>
                        <li><a href="#">部门-结构管理</a></li>
                        <li><a href="#">职级-结构管理</a></li>
                        <li><a href="#">学科-结构管理</a></li>
                    </ul>
                </li>
                <li><a href="#">正在开发……</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-top: -490px">
            <div class="row">
                <h2 class="sub-header" style="margin-left: 10px">教师管理</h2>
                <div class="col-sm-1">
                    <!-- 按钮触发模态框 -->
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" onclick="addFrom()">新增</button>
                </div>
                <div class="col-sm-6">
                    <form action="" method="post" id="searchForm">
                        <div class="input-group">
                            <input type="text" class="form-control" name="keyword" value="${keyword}"
                                   placeholder="输入关键字"/>
                            <span class="input-group-btn" style="width: 1px">
                                <button class="btn btn-default" type="button" onclick="searchTeacher()">查询</button>
                                <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum}"/>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 table-responsive" style="margin-top: 10px;">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>昵称</th>
<%--                            <th>班级</th>--%>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>科目</th>
                            <th>职位</th>
                            <th>部门</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="teacher" items="${page.list}" varStatus="status">
                            <tr>
                                <td>${teacher.loginName}</td>
<%--                                <td>--%>
<%--                                    <c:if test="${teacher.classNum == 201804 }">--%>
<%--                                        2018级4班--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${teacher.classNum == 201805 }">--%>
<%--                                        2018级5班--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${teacher.classNum == 201806 }">--%>
<%--                                        2018级6班--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${teacher.classNum == 201807 }">--%>
<%--                                        2018级7班--%>
<%--                                    </c:if>--%>
<%--                                </td>--%>
                                <td>${teacher.realName}</td>
                                <td>${teacher.age}</td>
                                <td>${teacher.sex}</td>
                                <td>${teacher.project}</td>
                                <td>
                                    <c:if test="${teacher.rank == 1}">
                                        <span>校长</span>
                                    </c:if>
                                    <c:if test="${teacher.rank == 2}">
                                        <span>副校长</span>
                                    </c:if>
                                    <c:if test="${teacher.rank == 3}">
                                        <span>主任</span>
                                    </c:if>
                                    <c:if test="${teacher.rank == 4}">
                                        <span>班主任</span>
                                    </c:if>
                                    <c:if test="${teacher.rank == 5}">
                                        <span>老师</span>
                                    </c:if>
                                </td>
                                <td>${teacher.unit}</td>
                                <td>
                                    <!-- 按钮触发模态框 -->
                                    <button type="button" class="btn btn-info" onclick="editPage(${teacher.id})"
                                            data-toggle="modal" data-target="#myModal1">修改
                                    </button>
                                    <button type="button" class="btn btn-danger" onclick="del(${teacher.id})">删除</button>
                                    <button type="button" class="btn btn-primary"
                                            data-toggle="modal" data-target="#myModal2" onclick="myLeader('${teacher.unit}')">TA的上级
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-6">当前 ${page.pageNum }页,总${page.pages }
                    页,总 ${page.total } 条记录
                </div>
                <!-- 分页条信息 -->
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/user/teacherPage?pageNum=1">首页</a></li>
                            <c:if test="${page.hasPreviousPage }">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/teacherPage?pageNum=${page.pageNum-1}"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                            </c:if>

                            <c:forEach items="${page.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num == page.pageNum }">
                                    <li class="active"><a href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num != page.pageNum }">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/teacherPage?pageNum=${page_Num }">${page_Num }</a>
                                    </li>
                                </c:if>

                            </c:forEach>
                            <c:if test="${page.hasNextPage }">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/teacherPage?pageNum=${page.pageNum+1 }"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                            </c:if>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/teacherPage?pageNum=${page.pages}">末页</a>
                            </li>
                            <li class="dropdown" style="display: inline;">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    ${page.pageSize}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/teacherPage?pageSize=10">10</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/teacherPage?pageSize=50">50</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/teacherPage?pageSize=100">100</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!--新增页面-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <form id="saveForm">
                        <table class="table table-striped">
                            <tr>
                                <td>昵称</td>
                                <td><input name="loginName" type="text"/></td>
                            </tr>
                            <tr>
                                <td>班级</td>
                                <td>
                                    <select name="classNum" style="height: 28px;">
                                        <option>--请选择--</option>
                                        <c:forEach var="classList" items="${classList}" varStatus="status">
                                            <option value="${classList.code}">
                                                    ${classList.value}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>姓名</td>
                                <td><input name="realName" type="text"/></td>
                            </tr>
                            <tr>
                                <td>年龄</td>
                                <td><input name="age" type="text"/></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <select name="sex" style="height: 28px;">
                                        <option value="男">
                                            男
                                        </option>
                                        <option value="女">
                                            女
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>科目</td>
                                <td>
                                    <select name="project" style="height: 28px;">
                                        <option value="">
                                            无
                                        </option>
                                        <option value="语文">
                                            语文
                                        </option>
                                        <option value="数学">
                                            数学
                                        </option>
                                        <option value="物理">
                                            物理
                                        </option>
                                        <option value="化学">
                                            化学
                                        </option>
                                        <option value="英语">
                                            英语
                                        </option>
                                        <option value="政治">
                                            政治
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>职位</td>
                                <td>
                                    <select name="rank" style="height: 28px;">
                                        校长,副校长,主任,班主任,老师
                                        <option value="1">
                                            校长
                                        </option>
                                        <option value="2">
                                            副校长
                                        </option>
                                        <option value="3">
                                            主任
                                        </option>
                                        <option value="4">
                                            班主任
                                        </option>
                                        <option value="5">
                                            老师
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>部门</td>
                                <td>
                                    <select name="unit" style="height: 28px;">
                                        <option value="语文教研室">
                                            语文教研室
                                        </option>
                                        <option value="数学教研室">
                                            数学教研室
                                        </option>
                                        <option value="物理教研室">
                                            物理教研室
                                        </option>
                                        <option value="化学教研室">
                                            化学教研室
                                        </option>
                                        <option value="英语教研室">
                                            英语教研室
                                        </option>
                                        <option value="政治教研室">
                                            政治教研室
                                        </option>
                                        <option value="学生处">
                                            学生处
                                        </option>
                                        <option value="管理层">
                                            管理层
                                        </option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addTeacher()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
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
                                <td>昵称</td>
                                <td><input name="loginName" type="text" class="loginName" placeholder="无"/></td>
                            </tr>
                            <tr>
                                <td>班级</td>
                                <td>
                                    <select name="classNum" style="height: 28px;">
                                        <option>--请选择--</option>
                                        <c:forEach var="classList" items="${classList}" varStatus="status">
                                            <option value="${classList.code}">
                                                    ${classList.value}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>姓名</td>
                                <td><input name="realName" type="text" class="realName" placeholder="无"/></td>
                            </tr>
                            <tr>
                                <td>年龄</td>
                                <td><input name="age" type="text" class="age" placeholder="无"/></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <select name="sex" style="height: 28px;">
                                        <option value="男">
                                            男
                                        </option>
                                        <option value="女">
                                            女
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>科目</td>
                                <td>
                                    <select name="project" style="height: 28px;">
                                        <option value="">
                                            无
                                        </option>
                                        <option value="语文">
                                            语文
                                        </option>
                                        <option value="数学">
                                            数学
                                        </option>
                                        <option value="物理">
                                            物理
                                        </option>
                                        <option value="化学">
                                            化学
                                        </option>
                                        <option value="英语">
                                            英语
                                        </option>
                                        <option value="政治">
                                            政治
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>职位</td>
                                <td>
                                    <select name="rank" style="height: 28px;">
                                        校长,副校长,主任,班主任,老师
                                        <option value="1">
                                            校长
                                        </option>
                                        <option value="2">
                                            副校长
                                        </option>
                                        <option value="3">
                                            主任
                                        </option>
                                        <option value="4">
                                            班主任
                                        </option>
                                        <option value="5">
                                            老师
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>部门</td>
                                <td>
                                    <select name="unit" style="height: 28px;">
                                        <option value="语文教研室">
                                            语文教研室
                                        </option>
                                        <option value="数学教研室">
                                            数学教研室
                                        </option>
                                        <option value="物理教研室">
                                            物理教研室
                                        </option>
                                        <option value="化学教研室">
                                            化学教研室
                                        </option>
                                        <option value="英语教研室">
                                            英语教研室
                                        </option>
                                        <option value="政治教研室">
                                            政治教研室
                                        </option>
                                        <option value="学生处">
                                            学生处
                                        </option>
                                        <option value="管理层">
                                            管理层
                                        </option>
                                    </select>
                                </td>
<%--                                <td><input name="unit" type="text" class="unit" placeholder="无"/></td>--%>
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

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">TA的上级</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <td>
                                姓名
                            </td>
                            <td>
                                管辖部门
                            </td>
                        </tr>
                        <tbody class="myLeader">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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
