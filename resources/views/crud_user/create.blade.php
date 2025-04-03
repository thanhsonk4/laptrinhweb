@extends('dashboard')

@section('content')
<main class="signup-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <h3 class="text-center py-4 mt-4">MÀN HÌNH ĐĂNG KÝ</h3>
                    <div class="card-body">
                        <form action="{{ route('user.postUser') }}" method="POST">
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
                                <label for="like" class="col-md-4 col-form-label text-md-end">Sở thích</label>
                                <div class="col-md-8">
                                    <input type="text" placeholder="" id="like" class="form-control" name="like" required>
                                    @if ($errors->has('like'))
                                    <span class="text-danger">{{ $errors->first('like') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label for="facebook" class="col-md-4 col-form-label text-md-end">Facebook</label>
                                <div class="col-md-8">
                                    <input type="text" placeholder="" id="facebook" class="form-control" name="facebook" required>
                                    @if ($errors->has('facebook'))
                                    <span class="text-danger">{{ $errors->first('facebook') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label for="email_address" class="col-md-4 col-form-label text-md-end">Email</label>
                                <div class="col-md-8">
                                    <input type="text" placeholder="" id="email_address" class="form-control" name="email" required autofocus>
                                    @if ($errors->has('email'))
                                    <span class="text-danger">{{ $errors->first('email') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="d-flex justify-content-end align-items-center gap-3">
                                <a href="{{ route('login') }}" class="text-primary">Đã có tài khoản</a>
                                <button type="submit" class="btn btn-primary">Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection