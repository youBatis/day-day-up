<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<div class="tab-pane">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <form class="form-horizontal m-t" id="theForm" action="">
                    <input id="id" name="id" value="${district.id}" type="hidden">
                    <input id="parentCode" name="parentCode" value="${district.parentCode}" type="hidden">
                    <input id="level" name="level" value="${disLevel}" >
                    <div class="form-group">
                        <label class="col-sm-3 control-label">编码：</label>
                        <div class="col-sm-8">
                            <input id="code" name="code" class="form-control" type="text" value="${district.code}"
                            <c:if test="${doUpdate}">readonly</c:if>     style="width: 50%">
                            <%--<span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 这里写点提示的内容</span>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称：</label>
                        <div class="col-sm-8">
                            <input id="name" name="name" class="form-control" type="text" value="${district.name}"
                                   aria-required="true" aria-invalid="false" class="valid"
                                   style="width: 50%">
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <button class="btn btn-warning" onclick="cancel();">取消</button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-primary" onclick="addOrUpdate();">提交</button>
                    </div>
                </div>
            </div>
        </div>
</div>
<!-- UY BEGIN -->
<%--<div id="uyan_frame"></div>--%>
<%--<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2146316"></script>--%>
<!-- UY END -->
<script>
    $(document).ready(function () {
    laydate.render({
        elem: '#up_birthday' //指定元素
    });
    });

    function cancel() {
        $("#loginModal").modal('hide');
    }

    function addOrUpdate(node){
        $.ajax({
            url: ctx + '/org_structure/district/update',
            type:'post',
            data:$("#theForm").serialize(),
            async: true,
            dataType:'json',
            success:function (data) {
                console.log(JSON.stringify(data));
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                // 状态码
                console.log(XMLHttpRequest.status);
                // 状态
                console.log(XMLHttpRequest.readyState);
                // 错误信息
                console.log(textStatus);
            }
        })
    }




</script>