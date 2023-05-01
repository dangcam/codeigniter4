<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-12 p-md-0">
                <div class="welcome-text">
                    <h4><?=lang('AppLang.page_title_report_group')?></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Table Hover</h4>
                    </div>
                    <div class="card-body">
                        <form method="post" id="form_id">
                            <input type="hidden" name="group_id" value="">
                            <input type="hidden" name="report_month" value="">
                            <input type="hidden" name="report_year" value="">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered table-striped table-responsive-sm">
                                <thead style="text-align:center" >
                                <tr>
                                    <th rowspan="3" style="vertical-align: middle">STT</th>
                                    <th rowspan="3" style="vertical-align: middle">Tên</th>
                                    <th colspan="4">Số hồ sơ phải giải quyết</th>
                                    <th colspan="4">Đã giải quyết</th>
                                    <th colspan="4">Đang giải quyết</th>
                                </tr>
                                <tr>
                                    <th rowspan="2" style="vertical-align: middle">Kỳ trước chuyển sang</th>
                                    <th colspan="2">Tiếp nhận trong kỳ</th>
                                    <th rowspan="2" style="vertical-align: middle">Cộng</th>

                                    <th rowspan="2" style="vertical-align: middle">Tổng số</th>
                                    <th rowspan="2" style="vertical-align: middle">Trước và trong hạn</th>
                                    <th rowspan="2" style="vertical-align: middle">Trễ hạn</th>
                                    <th rowspan="2" style="vertical-align: middle">Tỷ lệ trễ hạn (%)</th>
                                    <th rowspan="2" style="vertical-align: middle">Tổng số</th>
                                    <th rowspan="2" style="vertical-align: middle">Trong hạn</th>
                                    <th rowspan="2" style="vertical-align: middle">Quá hạn</th>
                                    <th rowspan="2" style="vertical-align: middle">Tỷ lệ quá hạn (%)</th>
                                </tr>
                                <tr>
                                    <th>Trực tiếp</th>
                                    <th>Trực tuyến</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>I</th>
                                    <th>Thuộc thẩm quyền của UBND cấp huyện
                                            <input type="hidden" name="data[1][name_row]" value="I">
                                    </th>
                                    <th><input type="number" name="data[I][value1_1]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value1_2]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value1_3]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value1_total]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value2_total]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value2_1]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value2_2]" class="form-control"></th>
                                    <th><input type="text" name="data[I][value2_per]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value3_total]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value3_1]" class="form-control"></th>
                                    <th><input type="number" name="data[I][value3_2]" class="form-control"></th>
                                    <th><input type="text" name="data[I][value_per]" class="form-control"></th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Giao đất
                                            <input type="hidden" name="data[I.1][name_row]" value="I1">
                                    </td>
                                    <td><input type="number" name="data[I.1][value1_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value1_2]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value1_3]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value1_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value2_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value2_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value2_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.1][value2_per]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value3_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value3_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.1][value3_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.1][value_per]" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Cho thuê đất
                                        <input type="hidden" name="data[I.2][name_row]" value="I2">
                                    </td>
                                    <td><input type="number" name="data[I.2][value1_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value1_2]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value1_3]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value1_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value2_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value2_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value2_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.2][value2_per]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value3_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value3_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.2][value3_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.2][value_per]" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Bán tài sản gắn liền với QSDĐ
                                        <input type="hidden" name="data[I.3][name_row]" value="I3">
                                    </td>
                                    <td><input type="number" name="data[I.3][value1_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value1_2]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value1_3]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value1_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value2_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value2_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value2_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.3][value2_per]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value3_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value3_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.3][value3_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.3][value_per]" class="form-control"></td>
                                </tr><tr>
                                    <td>4</td>
                                    <td>Bán tài sản gắn liền với QSDĐ
                                        <input type="hidden" name="data[I.4][name_row]" value="I4">
                                    </td>
                                    <td><input type="number" name="data[I.4][value1_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value1_2]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value1_3]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value1_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.44][value2_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value2_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value2_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.4][value2_per]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value3_total]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value3_1]" class="form-control"></td>
                                    <td><input type="number" name="data[I.4][value3_2]" class="form-control"></td>
                                    <td><input type="text" name="data[I.4][value_per]" class="form-control"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>