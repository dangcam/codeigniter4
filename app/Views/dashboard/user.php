<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6 p-md-0">
                <div class="welcome-text">
                    <h4>Danh sách người dùng</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
        <!---->
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Thông tin</h4>
                    </div>
                    <div class="card-body">
                        <div class="basic-form">
                            <form method="post">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Mã Người Dùng</label>
                                        <input type="text" name="user_id" class="form-control" placeholder="Mã Người Dùng">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Tên Người Dùng</label>
                                        <input type="text" name="username" class="form-control" placeholder="Tên Người Dùng">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Password</label>
                                        <input type="password" name="password" class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Email</label>
                                        <input type="email" name="email" class="form-control" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label>SĐT</label>
                                        <input type="text" name="phonenumber" class="form-control">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Giới tính</label>
                                        <select id="inputState" name="gender" class="form-control">
                                            <option value="1">Nam</option>
                                            <option value="2">Nữ</option>
                                            <option value="3">Khác</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input name="user_status" class="form-check-input" type="checkbox">
                                        <label class="form-check-label">
                                            Tình Trạng
                                        </label>
                                    </div>
                                    <input hidden name="group_id" value="1">
                                </div>
                                <button type="submit" name="user" class="btn btn-primary">Tạo người dùng</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!---->

            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Danh sách</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered verticle-middle table-responsive-sm">
                            <thead>
                            <tr>
                                <th scope="col">Mã Người Dùng</th>
                                <th scope="col">Tên Người Dùng</th>
                                <th scope="col">Giới tính</th>
                                <th scope="col">SĐT</th>
                                <th scope="col">Email</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($list_users as $user) :?>
                            <tr>
                                <td><?php echo $user['user_id']; ?></td>
                                <td><?php echo $user['username']; ?></td>
                                <td><?=$user['gender']==1?'Nam':($user['gender']==2?'Nữ':'Khác' )?></td>
                                <td><?php echo $user['phonenumber']; ?></td>
                                <td><?php echo $user['email']; ?></td>
                                <td><span><a href="javascript:void()" class="mr-4" data-toggle="tooltip"
                                             data-placement="top" title="Edit"><i
                                                    class="fa fa-pencil color-muted"></i> </a><a
                                                href="javascript:void()" data-toggle="tooltip"
                                                data-placement="top" title="Close"><i
                                                    class="fa fa-close color-danger"></i></a></span>
                                </td>
                            </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        <!---->
            </div>
        </div>
    </div>
</div>