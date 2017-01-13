<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="tenant/tenant"/>
    <title></title>
</head>
<body>
<asset:javascript src="jquery.maskMoney.js"/>
<g:render template="/templates/breadCrumb" model="[code: 'education.type']"/>
<div class="row">
    <div class="main-box clearfix">
        <header class="main-box-header clearfix">
            <h2 class="value" style="display: inline">
                Cars
            </h2>
            <button type="button" class="md-trigger btn btn-primary mrg-b-lg"
                    style="margin-bottom: 0;float: right"
                    onclick="resetCarDetailsFromModal()"
                    data-toggle="modal"
                    data-target="#modal-car">
                Add Cars
            </button>
        </header>
        <div class="row">
            <div class="col-lg-12">
                <g:render template="/templates/flashUpdate"/>
                <div class="main-box-body clearfix">
                    <div class="table-responsive clearfix">
                        <div id="carTable">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th><span>Name</span></th>
                                    <th><span>Amount</span></th>
                                    <th><span>Picture</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${cars}" status="index"
                                        var="car">
                                    <tr><td>
                                        ${index + 1}
                                    </td>
                                        <td id="car_name_${car.uuid}">${car?.name ?: '-'}</td>
                                        <td id="car_amount_${car.uuid}">${car?.amount ?: '0'}</td>
                                        <td id="car_picture_${car.uuid}">
                                            <img src="${createLink(controller: 'admin', action: 'showCarPic', params: [uuid: car?.uuid])}"
                                                 width="50" height="50" onclick='showFullSizePicture("${car?.uuid}")'
                                                 alt="" class="profile-img img-responsive">
                                        </td>
                                        <td>
                                            <button type="button"
                                                    class="btn btn-sm btn-primary"
                                                    onclick='updateCarDetail("${car.uuid}")'
                                                    data-toggle="modal"
                                                    data-target="#modal-car">
                                                Edit
                                            </button>
                                            <g:link class="btn btn-sm btn-danger"
                                                    controller="car"
                                                    action="deleteCar"
                                                    name="carDeleteLink"
                                                    params="[id: car.uuid]">
                                                Delete
                                            </g:link>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<g:render template="/car/modalForCar"/>
<div id="pictureShow">
    <g:render template="/car/modalShowFullSizePicture"/>
</div>
<script>
    jQuery(function ($) {
//        $('#loanAmount').number(true, 0);
        $("#carAmount").maskMoney({
            prefix: "$ ",
            allowNegative: false,
            thousands: ',',
            decimal: '.',
            precision: '0',
            affixesStay: false
        });
    });
    function updateCarDetail(uuid) {
        var carName = $('#car_name_' + uuid).text();
        var carAmount = $('#car_amount_' + uuid).html();
        $('#carName').val(carName);
        $('#carAmount').val(carAmount);
        $("#url").val('updateCar');
        $("#uuid").val('' + uuid);
    }
    function resetCarDetailsFromModal() {
        $("#carName").val('');
        $("#carAmount").val('');
        $("#url").val('createCar');
    }
    $(function () {
        $('a[name="carDeleteLink"]').bind('click', function () {
            if (confirm('Are you Sure?')) {
            }
            else {
                $(this).attr('href', "");
            }
        })
    });
    function showFullSizePicture(uuid) {
        $.ajax({
            url: "${createLink(controller:'admin',action: 'showFullSizeCarPicture')}",
            data: {uuid: uuid},
            success: function (data) {
                $("#pictureShow").html(data.template);
                $("#modal-fullSizePic").modal('show');
            },
            error: function (data) {
            }
        });
    }
</script>
</body>
</html>