@extends('dashboard')

@section('content')
<main class="login-form">
    <div class="container">
        <div class="row justify-content-center">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Roles</th>
                        <th>Đơn hàng</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($users as $user)
                    <tr>
                        <th>{{ $user->id }}</th>
                        <th>{{ $user->name }}</th>
                        <th>{{ $user->email }}</th>
                        <th>
                            @foreach($user->roles as $role)
                            <a href="{{ route('user.role', ['id' => $role->id]) }}">
                                {{ $role->name . ' ' }}
                            </a>
                            @endforeach
                        </th>
                        <td>
                            @if($user->orders->count())
                            <a href="{{ route('user.orders', $user->id) }}" class="btn btn-sm btn-outline-primary">
                                Xem đơn hàng ({{ $user->orders->count() }})
                            </a>
                            @else
                            <span class="text-muted">Không có</span>
                            @endif
                        </td>


                        <th>
                            <a href="{{ route('user.readUser', ['id' => $user->id]) }}">View</a> |
                            <a href="{{ route('user.updateUser', ['id' => $user->id]) }}">Edit</a> |
                            <a href="{{ route('user.deleteUser', ['id' => $user->id]) }}">Delete</a>
                        </th>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            {!! $users->withQueryString()->links('pagination::bootstrap-5') !!}
        </div>
    </div>
</main>
@endsection
<!-- <script>
function toggleOrders(userId) {
    const ordersDiv = document.getElementById(`orders-${userId}`);
    if (ordersDiv.style.display === "none") {
        ordersDiv.style.display = "block";
    } else {
        ordersDiv.style.display = "none";
    }
}
</script> -->