<div class="modal fade" id="modal-car" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">
                    Car
                </h4>
            </div>
        <div class="modal-body">
            <g:form id="carForm" controller="car" action="createUpdateCar"  enctype="multipart/form-data" method="post">
                <div class="form-group">
                    <label for="carName">Name</label>
                    <input type="text" class="form-control" id="carName" name="name"
                           placeholder="Car Name" required>
                </div>
                <div class="form-group">
                    <label for="carAmount">Amount</label>
                    <input type="text" class="form-control" id="carAmount" name="amount"
                           placeholder="Car Amount">
                </div>
                <div class="form-group">
                    <label for="carPic">Picture</label>
                    <div class="form-group">
                        <input type="file" name="carPic" id="carPic"/>
                    </div>
                </div>
                </div>
                <input type="hidden" name="url" id="url"/>
                <input type="hidden" name="uuid" id="uuid"/>
                <div class="modal-footer">
                    <button type="submit" id="" class="btn btn-primary">Done</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
<script>
    function resetUpdateValue() {
        $('#modalwindow').modal('hide');
    }
</script>


