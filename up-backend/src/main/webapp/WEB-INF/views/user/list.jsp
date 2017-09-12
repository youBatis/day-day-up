<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Mcgrady</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="${ctx}/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script>var ctx = '${ctx}',uid = '${user.id}';</script>

    <base target="_blank">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-content">

                    <div class="">
                        <a onclick="fnClickAddRow();" href="javascript:void(0);" class="btn btn-primary ">添加用户</a>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th>排序号</th>
                            <th>登录名</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>生日</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty pagination.data}">
                            <c:forEach items="${pagination.data }" var="user" varStatus="st">
                                <tr>
                                    <td>${(pagination.paging.pageNum-1) * pagination.paging.pageSize + st.count}</td>
                                    <td>${user.name}</td>
                                    <td>${user.userRealName}</td>
                                    <td>${user.email}</td>
                                    <td><fmt:formatDate value="${user.birthday}"
                                                        pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                    <td>${user.active.info}</td>

                                    <td>
                                        <a title="编辑"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                        &nbsp;&nbsp;&nbsp;
                                        <a title="删除" href="javascript:void(0);" onclick="delUser('${user.id}')"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </c:if>
                        </tbody>
                        <%--    <tfoot>
                            <tr>
                                <th>渲染引擎</th>
                                <th>浏览器</th>
                                <th>平台</th>
                                <th>引擎版本</th>
                                <th>CSS等级</th>
                            </tr>
                            </tfoot>--%>
                    </table>

                </div>
            </div>
        </div>
    </div>

</div>
<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${ctx}/static/js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="${ctx}/static/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${ctx}/static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script src="${ctx}/static/js/plugins/sweetalert/sweetalert.min.js"></script>



<script src="${ctx}/static/js/user/user.js"></script>
<script>
    $(document).ready(function () {
        $(".dataTables-example").dataTable();
        var oTable = $("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php", {
            "callback": function (sValue, y) {
                var aPos = oTable.fnGetPosition(this);
                oTable.fnUpdate(sValue, aPos[0], aPos[1])
            }, "submitdata": function (value, settings) {
                return {"row_id": this.parentNode.getAttribute("id"), "column": oTable.fnGetPosition(this)[2]}
            }, "width": "90%", "height": "100%"
        })
    });
    function fnClickAddRow() {
        $("#editable").dataTable().fnAddData(["Custom row", "New row", "New row", "New row", "New row"])
    };
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>