@extends('dashboard')

@section('content')
<main class="login-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <div class="card">
                    <h3 class="my-5 text-center">Màn hình chi tiết</h3>
                    <div class="card-body">
                        <table class="table table-borderless">
                            <tr>
                                <th>Username</th>
                                <td>{{$messi->name}}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>{{$messi->email}}</td>
                            </tr>
                        </table>
                        <div class="text-end mt-4">
                            <a href="{{ route('user.updateUser', ['id' => $messi->id]) }}" class="btn btn-primary">Chỉnh sửa</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>
@endsection