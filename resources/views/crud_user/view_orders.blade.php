@extends('layouts.app') {{-- Hoặc layouts.admin nếu bạn có --}}
@section('content')
<div class="container mt-4">
    <h3>Đơn hàng của {{ $user->name }}</h3>

    @forelse($user->orders as $order)
    <div class="card mb-3">
        <div class="card-body">
            <p><strong>Mã:</strong> {{ $order->id }}</p>
            <p><strong>Tổng tiền:</strong> {{ number_format($order->total_amount, 0, ',', '.') }} đ</p>
            <p><strong>Địa chỉ:</strong> {{ $order->address }}</p>
            <p><strong>Ngày:</strong> {{ $order->created_at->format('d/m/Y') }}</p>
        </div>
    </div>
    @empty
    <p class="text-muted">Người dùng này chưa có đơn hàng.</p>
    @endforelse

    <a href="{{ url()->previous() }}" class="btn btn-secondary">Quay lại</a>
</div>
@endsection