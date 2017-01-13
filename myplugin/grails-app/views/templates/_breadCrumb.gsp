<div id="content-header" class="clearfix">
    <div class="pull-left">
        <ol class="breadcrumb">
            <li><g:message code="home"/></li>
            <g:if test="${detail}">
                <li><g:message code="${code}"/></li>
                <li class="active"><span><g:message code="${detail}"/></span></li>
            </g:if>
            <g:else>
                <li class="active"><span><g:message code="${code}"/></span></li>
            </g:else>
        </ol>
    </div>
</div>