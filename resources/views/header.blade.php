<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
</head>

<body>
    <header class="py-3">
        <nav class="navbar navbar-light navbar-expand-lg mb-2 border bg-light">
            <div class="container d-flex justify-content-center">
                <nav class="d-flex align-items-center ">
                    <a href="#" class="navbar-brand mr-auto">Laravel Training</a>
                    <span class="text-muted me-3">|</span>
                    @guest
                    <a href="{{ route('login') }}" class="text-dark text-decoration-none me-3">Login</a>
                    <span class="text-muted me-3">|</span>
                    <a href="{{ route('user.createUser') }}" class="text-dark text-decoration-none">Create user</a>
                    @else
                    <a href="{{ route('signout') }}" class="text-dark text-decoration-none">Logout</a>
                    @endguest
                </nav>
            </div>
        </nav>
    </header>
</body>

</html>