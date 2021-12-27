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
            <a href="{{ route("vendor.products.index") }}" class="c-sidebar-nav-link {{ request()->is("vendor/products*") ? "c-active" : "" }}">
                <i class="c-sidebar-nav-icon fas fa-fw fa-shopping-basket">

                </i>
                {{ trans('cruds.product.title') }}
            </a>
        </li>

        <li class="c-sidebar-nav-dropdown {{ request()->is("vendor/profile") || request()->is("vendor/bank-account") || request()->is("vendor/upload-documents") ? "c-show" : "" }}">
            <a class="c-sidebar-nav-dropdown-toggle" href="#">
                <i class="fas fa-cogs c-sidebar-nav-icon"></i>
                Profile
            </a>
            <ul class="c-sidebar-nav-dropdown-items">
                <li class="c-sidebar-nav-item">
                    <a href="{{ route("vendor.profile") }}" class="c-sidebar-nav-link {{ request()->is("vendor/profile") ? "c-active" : "" }}">
                        <i class="c-sidebar-nav-icon fas fa-fw fa-user">

                        </i>
                        {{ trans('global.profile') }}
                    </a>
                </li>
                <li class="c-sidebar-nav-item">
                    <a href="{{ route("vendor.bank-account") }}" class="c-sidebar-nav-link {{ request()->is("vendor/bank-account") ? "c-active" : "" }}">
                        <i class="c-sidebar-nav-icon fas fa-fw fa-credit-card"></i>
                        Bank Account
                    </a>
                </li>
                <li class="c-sidebar-nav-item">
                    <a href="{{ route("vendor.mop") }}"
                       class="c-sidebar-nav-link {{ request()->is("vendor/mop") ? "c-active" : "" }}">
                        <i class="fas fa-cogs c-sidebar-nav-icon"></i>

                        Min Order Price
                    </a>
                </li>
{{--                <li class="c-sidebar-nav-item">--}}
{{--                    <a href="{{ route("vendor.shipment.pickkr.pickup-address") }}"--}}
{{--                       class="c-sidebar-nav-link {{ request()->is("vendor/shipment/pickkr/pickup-address") ? "c-active" : "" }}">--}}
{{--                        <i class="fas fa-cogs c-sidebar-nav-icon"></i>--}}

{{--                        Shipment Pickup address--}}
{{--                    </a>--}}
{{--                </li>--}}
                <li class="c-sidebar-nav-item">
                    <a href="{{ route("vendor.show.change.password.form") }}" class="c-sidebar-nav-link {{ request()->is("vendor/change-password") ? "c-active" : "" }}">
                        <i class="c-sidebar-nav-icon fas fa-fw fa-asterisk">

                        </i>
                        {{ trans('global.change_password') }}
                    </a>
                </li>
            </ul>
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
