<style>
    .c-sidebar-nav-link{
        color: #008000 !important;
    }
    .c-sidebar .c-sidebar-nav-dropdown-toggle{
        color: #008000 !important;
    }
    .c-sidebar .c-sidebar-nav-dropdown-toggle:hover{
        color: white !important;
        background-color: #008000 !important;
    }
    .c-sidebar .c-sidebar-nav-dropdown-toggle:hover .c-sidebar-nav-icon{
        color: white !important;
    }
    .c-sidebar-nav-link:hover{
        color: white !important;
        background-color: #008000 !important;
    }
    .c-sidebar-nav-link:hover .c-sidebar-nav-icon{
        color: white !important;
    }
    .c-sidebar-nav-icon{
        color: #008000 !important;
    }
    .c-active{
        background-color: rgba(83, 193, 83, 0.85) !important;
        color: white !important;
    }
    .c-active .c-sidebar-nav-icon{
        color: white !important;
    }

    .c-sidebar .c-sidebar-nav-dropdown.c-show{
        background-color: rgba(127, 187, 127, 0.34) !important;
    }
</style>
<div id="sidebar" class="c-sidebar c-sidebar-fixed c-sidebar-lg-show bg-white">

    <div class="c-sidebar-brand d-md-down-none bg-white">
        <a class="c-sidebar-brand-full" href="{{ route("vendor.dashboard") }}">
{{--            <img--}}
{{--                style="height: 80px"--}}
{{--                src="{{ asset('assets/assets/images/logo-1.png') }}" alt="logo">--}}
            {{ env('APP_NAME', 'Bulk Bajaar') }}
        </a>
    </div>

    <ul class="c-sidebar-nav">

        <li class="c-sidebar-nav-item">
            <a href="{{ route("vendor.dashboard") }}" class="c-sidebar-nav-link">
                <i class="c-sidebar-nav-icon fas fa-fw fa-tachometer-alt">

                </i>
                {{ trans('global.dashboard') }}
            </a>
        </li>

        <li class="c-sidebar-nav-item">
            <a href="{{ route("vendor.orders.index") }}" class="c-sidebar-nav-link {{ request()->is("vendor/orders") || request()->is("vendor/orders/*") ? "c-active" : "" }}">
                <i class="c-sidebar-nav-icon fas fa-fw fa-shopping-basket">

                </i>
                {{ trans('cruds.order.title') }}
            </a>
        </li>
        <li class="c-sidebar-nav-item">
            <a href="{{ route("vendor.assigned-orders.index") }}" class="c-sidebar-nav-link {{ request()->is("vendor/assigned-orders") || request()->is("franchisee/assigned-orders/*") ? "c-active" : "" }}">
                <i class="c-sidebar-nav-icon fas fa-fw fa-shopping-basket">

                </i>
                {{ trans('global.assigned_orders') }}
            </a>
        </li>
        <li class="c-sidebar-nav-item">
            <a href="{{ route("vendor.products.index") }}" class="c-sidebar-nav-link {{ request()->is("vendor/products*") ? "c-active" : "" }}">
                <i class="c-sidebar-nav-icon fas fa-fw fa-shopping-basket">

                </i>
                {{ trans('cruds.product.title') }}
            </a>
        </li>

        <li class="c-sidebar-nav-item">
            <a href="{{ route("vendor.profile") }}" class="c-sidebar-nav-link {{ request()->is("vendor/profile") || request()->is("vendor/upload-documents") ? "c-active" : "" }}">
                <i class="c-sidebar-nav-icon fas fa-fw fa-user">

                </i>
                {{ trans('global.profile') }}
            </a>
        </li>
        <li class="c-sidebar-nav-item">
            <a href="{{ route("vendor.show.change.password.form") }}" class="c-sidebar-nav-link {{ request()->is("vendor/change-password") ? "c-active" : "" }}">
                <i class="c-sidebar-nav-icon fas fa-fw fa-asterisk">

                </i>
                {{ trans('global.change_password') }}
            </a>
        </li>

        <li class="c-sidebar-nav-item">
            <a href="#" class="c-sidebar-nav-link" onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                <i class="c-sidebar-nav-icon fas fa-fw fa-sign-out-alt">

                </i>
                {{ trans('global.logout') }}
            </a>
        </li>
    </ul>

</div>
