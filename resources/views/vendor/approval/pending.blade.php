@extends("vendor.layout.app")
@section("content")
    <div class="card">
        <div class="card-header bg-warning">
            <h6 class="text-white">Account Status</h6>
        </div>
        <div class="card-body">
            <div class="alert alert-danger">
                <p>Your account is not approved by admin.We will send you a notification email , when your account get approved</p>
            </div>
        </div>
        <div class="card-footer">
            <form id="logoutForm" action="{{ route('vendor.logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
            <button href="#" onclick="event.preventDefault(); document.getElementById('logoutForm').submit();" class="btn btn-info">Log Out</button>
        </div>
    </div>
@endsection
