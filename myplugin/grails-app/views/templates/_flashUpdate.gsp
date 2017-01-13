<g:if test="${flash.message}">
    <div class="${flash.css ?: 'alert alert-success'}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        %{--<i class="fa fa-info-circle fa-fw fa-lg"></i>--}%
        <strong>${raw(flash.message)}</strong>
    </div>
</g:if>
<g:if test="${flash.error}">
    <div class="${flash.css ?: 'alert alert-danger'}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        %{--<i class="fa fa-info-circle fa-lg"></i>--}%
        <strong style="color:red;">${raw(flash.error)}</strong>
    </div>
</g:if>

<helper:showAlert/>
