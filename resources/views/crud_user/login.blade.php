@extends('dashboard')

@section('content')
<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <h3 class="text-center py-4 mt-4">MÀN HÌNH ĐĂNG NHẬP</h3>
                    <div class="card-body">
                        <form method="POST" action="{{ route('user.authUser') }}">
                            @csrf
                            <div class="form-group row mb-3">
                                <label for="name" class="col-md-4 col-form-label text-md-end">Username</label>
                                <div class="col-md-8">
                                    <input type="text" placeholder="" id="name" class="form-control" name="name" required autofocus>
                                    @if ($errors->has('name'))
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label for="password" class="col-md-4 col-form-label text-md-end">Mật khẩu</label>
                                <div class="col-md-8">
                                    <input type="password" placeholder="" id="password" class="form-control" name="password" required>
                                    @if ($errors->has('password'))
                                    <span class="text-danger">{{ $errors->first('password') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <div class="col-md-8 offset-md-4">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="remember" name="remember">
                                        <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end align-items-center gap-2">
                                <a href="#" class="btn btn-link p-0">Quên mật khẩu</a>
                                <button type="submit" class="btn btn-primary">Đăng nhập</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection