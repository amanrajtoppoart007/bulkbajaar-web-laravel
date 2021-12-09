<style>
    .c-sidebar-nav-link {
        color: #008000 !important;
    }

    .c-sidebar .c-sidebar-nav-dropdown-toggle {
        color: #008000 !important;
    }

    .c-sidebar .c-sidebar-nav-dropdown-toggle:hover {
        color: white !important;
        background-color: #008000 !important;
    }

    .c-sidebar .c-sidebar-nav-dropdown-toggle:hover .c-sidebar-nav-icon {
        color: white !important;
    }

    .c-sidebar-nav-link:hover {
        color: white !important;
        background-color: #008000 !important;
    }

    .c-sidebar-nav-link:hover .c-sidebar-nav-icon {
        color: white !important;
    }

    .c-sidebar-nav-icon {
        color: #008000 !important;
    }

    .c-active {
        background-color: rgba(83, 193, 83, 0.85) !important;
        color: white !important;
    }

    .c-active .c-sidebar-nav-icon {
        color: white !important;
    }

    .c-sidebar .c-sidebar-nav-dropdown.c-show {
        background-color: rgba(127, 187, 127, 0.34) !important;
    }
</style>
<div id="sidebar" class="c-sidebar c-sidebar-fixed c-sidebar-lg-show bg-white">

    <div class="c-sidebar-brand d-md-down-none bg-white">
        <a class="c-sidebar-brand-full" href="{{ route("admin.home") }}">
{{--            <img--}}
{{--                style="height: 80px"--}}
{{--                src="{{ asset('assets/assets/images/logo-1.png') }}" alt="logo">--}}
            Bulk Bajaar
        </a>
    </div>

    <ul class="c-sidebar-nav mt-2">
        <li class="c-sidebar-nav-item">
            <a href="{{ route("admin.home") }}" class="c-sidebar-nav-link">
                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                {{ trans('global.dashboard') }}
            </a>
        </li>
{{--        <li class="c-sidebar-nav-item">--}}
{{--            <a href="{{ route("admin.sliders.index") }}"--}}
{{--               class="c-sidebar-nav-link {{ request()->is("admin/sliders") || request()->is("admin/sliders/*") ? "c-active" : "" }}">--}}
{{--                <svg class="c-sidebar-nav-icon" enable-background="new 0 0 508 508" height="30"--}}
{{--                     viewBox="0 0 508 508" width="30" xmlns="http://www.w3.org/2000/svg">--}}
{{--                    <g>--}}
{{--                        <path--}}
{{--                            d="m254 376c-22.056 0-40 17.944-40 40s17.944 40 40 40 40-17.944 40-40-17.944-40-40-40zm0 60c-11.028 0-20-8.972-20-20s8.972-20 20-20 20 8.972 20 20-8.972 20-20 20zm-140-54c-18.748 0-34 15.252-34 34s15.252 34 34 34 34-15.252 34-34-15.252-34-34-34zm0 48c-7.72 0-14-6.28-14-14s6.28-14 14-14 14 6.28 14 14-6.28 14-14 14zm280-48c-18.748 0-34 15.252-34 34s15.252 34 34 34 34-15.252 34-34-15.252-34-34-34zm0 48c-7.72 0-14-6.28-14-14s6.28-14 14-14 14 6.28 14 14-6.28 14-14 14zm-60-230c29.776 0 54-24.224 54-54s-24.224-54-54-54-54 24.224-54 54 24.224 54 54 54zm0-88c18.748 0 34 15.252 34 34s-15.252 34-34 34-34-15.252-34-34 15.252-34 34-34zm164 81.07c5.51 0 10 4.49 10 10s-4.49 10-10 10-10-4.49-10-10 4.49-10 10-10zm-488 20c-5.51 0-10-4.48-10-10 0-5.51 4.49-10 10-10s10 4.49 10 10c0 5.52-4.49 10-10 10zm468-131.428h-50v-19.642c0-5.523-4.477-10-10-10h-328c-5.523 0-10 4.477-10 10v20h-50c-16.569 0-30 13.431-30 30v45.723c0 5.318 4 9.973 9.306 10.334 5.822.397 10.694-4.236 10.694-9.976v-46.081c.01-5.5 4.5-9.99 10-10h50v206h-50c-5.5-.01-9.99-4.5-10-10v-49.93c0-5.74-4.872-10.373-10.694-9.976-5.306.361-9.306 5.016-9.306 10.334v49.572c0 16.569 13.431 30 30 30h50v20c0 5.523 4.477 10 10 10h328c5.523 0 10-4.477 10-10v-20.358h50c16.569 0 30-13.431 30-30v-49.572c0-5.318-4-9.973-9.306-10.334-5.822-.396-10.694 4.237-10.694 9.976v49.93c-.01 5.5-4.5 9.99-10 10h-50v-206h50c5.5.01 9.99 4.5 10 10v46.081c0 5.74 4.872 10.373 10.694 9.976 5.306-.361 9.306-5.016 9.306-10.334v-45.723c0-16.569-13.431-30-30-30zm-70-9.642v262.172l-133.226-124.538c-16.977-15.87-43.573-15.869-60.549 0l-29.901 27.951-73.111-91.388c-3.008-3.76-6.877-6.582-11.214-8.295v-65.902zm-308 92.195 99.601 124.5c8.322 10.402 23.939-2.092 15.617-12.494l-18.362-22.953 31.028-29.004c9.317-8.71 23.916-8.71 33.233 0l121.69 113.756h-282.807z"/>--}}
{{--                    </g>--}}
{{--                </svg>--}}
{{--                {{ trans('cruds.slider.title') }}--}}
{{--            </a>--}}
{{--        </li>--}}
        @can('user_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/users*") ? "c-show" : "" }} {{ request()->is("admin/user-addresses*") ? "c-show" : "" }} {{ request()->is("admin/user-profiles*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-users c-sidebar-nav-icon"></i>
                    {{ trans('cruds.userManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('user_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.users.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/users") || request()->is("admin/users/*") ? "c-active" : "" }}">
                                <i class="fas fa-users c-sidebar-nav-icon"></i>
                                {{ trans('cruds.user.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('user_address_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.user-addresses.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/user-addresses") || request()->is("admin/user-addresses/*") ? "c-active" : "" }}">
                                <i class="fas fa-map-marker-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.userAddress.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('user_profile_access')
                        <li class="d-none c-sidebar-nav-item">
                            <a href="{{ route("admin.user-profiles.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/user-profiles") || request()->is("admin/user-profiles/*") ? "c-active" : "" }}">
                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.userProfile.title') }}
                            </a>
                        </li>
                    @endcan
                </ul>
            </li>
        @endcan

        <li class="c-sidebar-nav-dropdown {{ request()->is("admin/bills*") ? "c-show" : "" }} {{ request()->is("admin/vendors*") ? "c-show" : "" }} {{ request()->is("admin/master-stocks*") ? "c-show" : "" }}">
            <a class="c-sidebar-nav-dropdown-toggle" href="#">
                <i class="fas fa-users c-sidebar-nav-icon"></i>
                Seller Management
            </a>
            <ul class="c-sidebar-nav-dropdown-items">
                <li class="c-sidebar-nav-item">
                    <a href="{{ route("admin.vendors.index") }}"
                       class="c-sidebar-nav-link {{ request()->is("admin/vendors") || request()->is("admin/vendors/*") ? "c-active" : "" }}">

                        <i class="fas fa-users c-sidebar-nav-icon"></i>

                        {{ trans('cruds.franchisee.title') }}
                    </a>
                </li>
            </ul>
        </li>

        @can('product_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/product-categories*") ? "c-show" : "" }} {{ request()->is("admin/product-sub-categories*") ? "c-show" : "" }} {{ request()->is("admin/product-tags*") ? "c-show" : "" }} {{ request()->is("admin/products*") ? "c-show" : "" }} {{ request()->is("admin/brands*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-box-open c-sidebar-nav-icon"></i>
                    {{ trans('cruds.productManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('product_category_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.product-categories.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/product-categories") || request()->is("admin/product-categories/*") ? "c-active" : "" }}">
                                <i class="fas fa-box-open c-sidebar-nav-icon"></i>
                                {{ trans('cruds.productCategory.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('product_category_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.product-sub-categories.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/product-sub-categories") || request()->is("admin/product-sub-categories/*") ? "c-active" : "" }}">
                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.productSubCategory.title') }}
                            </a>
                        </li>
                    @endcan
{{--                    @can('product_tag_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.product-tags.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/product-tags") || request()->is("admin/product-tags/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.productTag.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
                    @can('product_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.products.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/products") || request()->is("admin/products/*") ? "c-active" : "" }}">

                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.product.title') }}
                            </a>
                        </li>
                    @endcan
{{--                    @can('brand_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.brands.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/brands") || request()->is("admin/brands/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.brand.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}

                    <li class="c-sidebar-nav-item">
                        <a href="{{ route("admin.unit-types.index") }}"
                           class="c-sidebar-nav-link {{ request()->is("admin/unit-types") || request()->is("admin/unit-types/*") ? "c-active" : "" }}">

                            <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                            {{ trans('cruds.unitType.title') }}
                        </a>
                    </li>
                </ul>
            </li>
        @endcan
        @can('order_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/orders") ? "c-show" : "" }} {{ request()->is("admin/orders/*") ? "c-show" : "" }} {{ request()->is("admin/carts*") ? "c-show" : "" }} {{ request()->is("admin/franchisee-orders") ? "c-show" : "" }} {{ request()->is("admin/franchisee-orders/*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-shopping-bag c-sidebar-nav-icon"></i>
                    {{ trans('cruds.orderManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('order_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.orders.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/orders") || request()->is("admin/orders/*") ? "c-active" : "" }}">
                                <i class="fas fa-shopping-bag c-sidebar-nav-icon"></i>
                                {{ trans('cruds.order.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('cart_access')
                        <li class="c-sidebar-nav-item d-none">
                            <a href="{{ route("admin.carts.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/carts") || request()->is("admin/carts/*") ? "c-active" : "" }}">
                                <i class="fa-fw fas fa-cogs c-sidebar-nav-icon"></i>
                                {{ trans('cruds.cart.title') }}
                            </a>
                        </li>
                    @endcan
                </ul>
            </li>
        @endcan
        @can('transaction_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/transactions*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-credit-card c-sidebar-nav-icon"></i>
                    {{ trans('cruds.transactionManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('transaction_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.transactions.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/transactions") || request()->is("admin/transactions/*") ? "c-active" : "" }}">
                                <i class="fas fa-credit-card c-sidebar-nav-icon"></i>
                                {{ trans('cruds.transaction.title') }}
                            </a>
                        </li>
                    @endcan
                </ul>
            </li>
        @endcan
{{--        @can('user_alert_access')--}}
{{--            <li class="c-sidebar-nav-item">--}}
{{--                <a href="{{ route("admin.user-alerts.index") }}"--}}
{{--                   class="c-sidebar-nav-link {{ request()->is("admin/user-alerts") || request()->is("admin/user-alerts/*") ? "c-active" : "" }}">--}}
{{--                    <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                    {{ trans('cruds.userAlert.title') }}--}}
{{--                </a>--}}
{{--            </li>--}}
{{--        @endcan--}}
{{--        <li class="c-sidebar-nav-item">--}}
{{--            <a href="{{ route("admin.push-notifications.index") }}"--}}
{{--               class="c-sidebar-nav-link {{ request()->is("admin/push-notifications") ? "c-active" : "" }}">--}}
{{--                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                {{ trans('cruds.notifications.title') }}--}}
{{--            </a>--}}
{{--        </li>--}}
        @can('content_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/content-categories*") ? "c-show" : "" }} {{ request()->is("admin/content-tags*") ? "c-show" : "" }} {{ request()->is("admin/content-pages*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                    {{ trans('cruds.contentManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('content_category_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.content-categories.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/content-categories") || request()->is("admin/content-categories/*") ? "c-active" : "" }}">
                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.contentCategory.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('content_tag_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.content-tags.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/content-tags") || request()->is("admin/content-tags/*") ? "c-active" : "" }}">
                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.contentTag.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('content_page_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.content-pages.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/content-pages") || request()->is("admin/content-pages/*") ? "c-active" : "" }}">
                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>
                                {{ trans('cruds.contentPage.title') }}
                            </a>
                        </li>
                    @endcan
                </ul>
            </li>
        @endcan
{{--        @can('faq_management_access')--}}
{{--            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/faq-categories*") ? "c-show" : "" }} {{ request()->is("admin/faq-questions*") ? "c-show" : "" }}">--}}
{{--                <a class="c-sidebar-nav-dropdown-toggle" href="#">--}}
{{--                    <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                    {{ trans('cruds.faqManagement.title') }}--}}
{{--                </a>--}}
{{--                <ul class="c-sidebar-nav-dropdown-items">--}}
{{--                    @can('faq_category_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.faq-categories.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/faq-categories") || request()->is("admin/faq-categories/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.faqCategory.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('faq_question_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.faq-questions.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/faq-questions") || request()->is("admin/faq-questions/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.faqQuestion.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--        @endcan--}}

        @can('area_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/pincodes*") ? "c-show" : "" }} {{ request()->is("admin/states*") ? "c-show" : "" }} {{ request()->is("admin/districts*") ? "c-show" : "" }} {{ request()->is("admin/blocks*") ? "c-show" : "" }} {{ request()->is("admin/areas*") ? "c-show" : "" }} {{ request()->is("admin/cities*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-map-marked c-sidebar-nav-icon"></i>
                    {{ trans('cruds.areaManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('state_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.states.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/states") || request()->is("admin/states/*") ? "c-active" : "" }}">

                                <i class="fas fa-map-marker c-sidebar-nav-icon"></i>
                                {{ trans('cruds.state.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('district_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.districts.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/districts") || request()->is("admin/districts/*") ? "c-active" : "" }}">

                                <i class="fas fa-map-pin c-sidebar-nav-icon"></i>
                                {{ trans('cruds.district.title') }}
                            </a>
                        </li>
                    @endcan


{{--                    @can('block_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.blocks.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/blocks") || request()->is("admin/blocks/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.block.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('pincode_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.pincodes.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/pincodes") || request()->is("admin/pincodes/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.pincode.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('area_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.areas.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/areas") || request()->is("admin/areas/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.area.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('city_access')--}}
{{--                        <li class="c-sidebar-nav-item d-none">--}}
{{--                            <a href="{{ route("admin.cities.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/cities") || request()->is("admin/cities/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.city.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
                </ul>
            </li>
        @endcan
        @can('logistics_managment_access')
{{--            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/logistics*") ? "c-show" : "" }}">--}}
{{--                <a class="c-sidebar-nav-dropdown-toggle" href="#">--}}

{{--                    <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                    {{ trans('cruds.logisticsManagment.title') }}--}}
{{--                </a>--}}
{{--                <ul class="c-sidebar-nav-dropdown-items">--}}
{{--                    @can('logistic_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.logistics.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/logistics") || request()->is("admin/logistics/*") ? "c-active" : "" }}">--}}
{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.logistic.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                </ul>--}}
{{--            </li>--}}
        @endcan
{{--        @can('forum_management_access')--}}
{{--            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/articles*") ? "c-show" : "" }} {{ request()->is("admin/article-tags*") ? "c-show" : "" }} {{ request()->is("admin/article-comments*") ? "c-show" : "" }} {{ request()->is("admin/followers*") ? "c-show" : "" }} {{ request()->is("admin/article-likes*") ? "c-show" : "" }}">--}}
{{--                <a class="c-sidebar-nav-dropdown-toggle" href="#">--}}

{{--                    <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                    {{ trans('cruds.forumManagement.title') }}--}}
{{--                </a>--}}
{{--                <ul class="c-sidebar-nav-dropdown-items">--}}
{{--                    @can('article_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.articles.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/articles") || request()->is("admin/articles/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.article.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('article_tag_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.article-tags.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/article-tags") || request()->is("admin/article-tags/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.articleTag.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('article_comment_access')--}}
{{--                        <li class="c-sidebar-nav-item d-none">--}}
{{--                            <a href="{{ route("admin.article-comments.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/article-comments") || request()->is("admin/article-comments/*") ? "c-active" : "" }}">--}}
{{--                                <i class="fa-fw fas fa-cogs c-sidebar-nav-icon">--}}

{{--                                </i>--}}
{{--                                {{ trans('cruds.articleComment.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('follower_access')--}}
{{--                        <li class="c-sidebar-nav-item d-none">--}}
{{--                            <a href="{{ route("admin.followers.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/followers") || request()->is("admin/followers/*") ? "c-active" : "" }}">--}}
{{--                                <i class="fa-fw fas fa-cogs c-sidebar-nav-icon">--}}

{{--                                </i>--}}
{{--                                {{ trans('cruds.follower.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                    @can('article_like_access')--}}
{{--                        <li class="c-sidebar-nav-item d-none">--}}
{{--                            <a href="{{ route("admin.article-likes.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/article-likes") || request()->is("admin/article-likes/*") ? "c-active" : "" }}">--}}
{{--                                <i class="fa-fw fas fa-cogs c-sidebar-nav-icon">--}}

{{--                                </i>--}}
{{--                                {{ trans('cruds.articleLike.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--        @endcan--}}
        @can('setting_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/settings*") ? "c-show" : "" }} {{ request()->is("admin/shiprocket-settings*") ? "c-show" : "" }} {{ request()->is("admin/site-setting*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">
                    <i class="fas fa-cogs c-sidebar-nav-icon"></i>
                    Settings
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    <li class="c-sidebar-nav-item">
                        <a href="{{ route("admin.settings.index") }}"
                           class="c-sidebar-nav-link {{ request()->is("admin/settings*") ? "c-active" : "" }}">
                            <i class="fas fa-cogs c-sidebar-nav-icon"></i>

                            {{ trans('cruds.setting.title') }}
                        </a>
                    </li>
                    <li class="c-sidebar-nav-item">
                        <a href="{{ route("admin.shiprocket.settings.index") }}"
                           class="c-sidebar-nav-link {{ request()->is("admin/shiprocket-settings*") ? "c-active" : "" }}">
                            <i class="fas fa-cogs c-sidebar-nav-icon"></i>

                            Shiprocket Settings
                        </a>
                    </li>
                    <li class="c-sidebar-nav-item">
                        <a href="{{ route("admin.site-setting.index") }}"
                           class="c-sidebar-nav-link {{ request()->is("admin/site-settings") ? "c-active" : "" }}">
                            <i class="fas fa-cogs c-sidebar-nav-icon"></i>

                            Site Settings
                        </a>
                    </li>
                </ul>
            </li>

        @endcan
        @can('admin_management_access')
            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/permissions*") ? "c-show" : "" }} {{ request()->is("admin/roles*") ? "c-show" : "" }} {{ request()->is("admin/audit-logs*") ? "c-show" : "" }} {{ request()->is("admin/admins*") ? "c-show" : "" }}">
                <a class="c-sidebar-nav-dropdown-toggle" href="#">

                    <i class="fas fa-users-cog c-sidebar-nav-icon"></i>

                    {{ trans('cruds.adminManagement.title') }}
                </a>
                <ul class="c-sidebar-nav-dropdown-items">
                    @can('permission_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.permissions.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/permissions") || request()->is("admin/permissions/*") ? "c-active" : "" }}">

                                <i class="fas fa-user-check c-sidebar-nav-icon"></i>
                                {{ trans('cruds.permission.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('role_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.roles.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/roles") || request()->is("admin/roles/*") ? "c-active" : "" }}">

                                <i class="fas fa-user-tie c-sidebar-nav-icon"></i>
                                {{ trans('cruds.role.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('audit_log_access')
                        <li class="c-sidebar-nav-item d-none">
                            <a href="{{ route("admin.audit-logs.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/audit-logs") || request()->is("admin/audit-logs/*") ? "c-active" : "" }}">
                                <i class="fa-fw fas fa-file-alt c-sidebar-nav-icon">

                                </i>
                                {{ trans('cruds.auditLog.title') }}
                            </a>
                        </li>
                    @endcan
                    @can('admin_access')
                        <li class="c-sidebar-nav-item">
                            <a href="{{ route("admin.admins.index") }}"
                               class="c-sidebar-nav-link {{ request()->is("admin/admins") || request()->is("admin/admins/*") ? "c-active" : "" }}">
                                <i class="fas fa-users c-sidebar-nav-icon"></i>
                                {{ trans('cruds.admin.title') }}
                            </a>
                        </li>
                    @endcan
                </ul>
            </li>
        @endcan
{{--        @can('information_center_access')--}}
{{--            <li class="c-sidebar-nav-dropdown {{ request()->is("admin/crops*") ? "c-show" : "" }}">--}}
{{--                <a class="c-sidebar-nav-dropdown-toggle" href="#">--}}

{{--                    <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                    {{ trans('cruds.informationCenter.title') }}--}}
{{--                </a>--}}
{{--                <ul class="c-sidebar-nav-dropdown-items">--}}
{{--                    @can('crop_access')--}}
{{--                        <li class="c-sidebar-nav-item">--}}
{{--                            <a href="{{ route("admin.crops.index") }}"--}}
{{--                               class="c-sidebar-nav-link {{ request()->is("admin/crops") || request()->is("admin/crops/*") ? "c-active" : "" }}">--}}

{{--                                <i class="fas fa-tachometer-alt c-sidebar-nav-icon"></i>--}}
{{--                                {{ trans('cruds.crop.title') }}--}}
{{--                            </a>--}}
{{--                        </li>--}}
{{--                    @endcan--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--        @endcan--}}
        @if(file_exists(app_path('Http/Controllers/Auth/ChangePasswordController.php')))
            @can('profile_password_edit')
                <li class="c-sidebar-nav-item">
                    <a class="c-sidebar-nav-link {{ request()->is('admin/change-password') ? 'c-active' : '' }}"
                       href="{{ route('admin.show.change.password.form') }}">

                        <i class="fas fa-lock c-sidebar-nav-icon"></i>

                        {{ trans('global.change_password') }}
                    </a>
                </li>
            @endcan
        @endif
        <li class="c-sidebar-nav-item">
            <a href="#" class="c-sidebar-nav-link"
               onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                <i class="fas fa-sign-out-alt c-sidebar-nav-icon"></i>
                {{ trans('global.logout') }}
            </a>
        </li>
    </ul>

</div>
