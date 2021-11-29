
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">



    <!-- Webpage Title -->
    <title>Bulk Bajaar</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">


    <!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">

    <style type="text/css">
        /* Description: Master CSS file */

        /*****************************************
        Table Of Contents:
        - General Styles
        - Header
        - Media Queries
        ******************************************/

        /*****************************************
        Colors:
        - Buttons - red #a91265
        - Icons - blue #005282
        - Heading text - white #ffffff
        - Body text - white #ffffff
        ******************************************/


        /**************************/
        /*     General Styles     */
        /**************************/
        body,
        html {
            width: 100%;
            height: 100%;
        }

        body, p {
            color: #ffffff;
            font: 400 1rem/1.625rem "Open Sans", sans-serif;
        }

        h1 {
            font-weight: 700;
            font-size: 2.5rem;
            line-height: 3.25rem;
        }

        h2 {
            font-weight: 700;
            font-size: 2rem;
            line-height: 2.625rem;
        }

        h3 {
            font-weight: 700;
            font-size: 1.5rem;
            line-height: 2.25rem;
        }

        h4 {
            font-weight: 700;
            font-size: 1.25rem;
            line-height: 1.75rem;
        }

        h5 {
            font-weight: 700;
            font-size: 1.125rem;
            line-height: 1.625rem;
        }

        h6 {
            font-weight: 700;
            font-size: 1rem;
            line-height: 1.5rem;
        }

        .p-large {
            font-size: 1.25rem;
            line-height: 1.875rem;
        }

        a {
            color: #ffffff;
            text-decoration: underline;
        }

        a:hover {
            color: #ffffff;
            text-decoration: underline;
        }

        .btn-solid-reg {
            display: inline-block;
            padding: 1.375rem 2.25rem 1.375rem 2.25rem;
            border: 1px solid #a91265;
            border-radius: 32px;
            background-color: #a91265;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.875rem;
            line-height: 0;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-solid-reg:hover {
            border: 1px solid #a91265;
            background-color: transparent;
            color: #a91265;
            text-decoration: none;
        }

        .btn-solid-lg {
            display: inline-block;
            padding: 1.625rem 2.625rem 1.625rem 2.625rem;
            border: 1px solid #a91265;
            border-radius: 32px;
            background-color: #a91265;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.875rem;
            line-height: 0;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-solid-lg:hover {
            border: 1px solid #a91265;
            background-color: transparent;
            color: #a91265;
            text-decoration: none;
        }

        .btn-outline-reg {
            display: inline-block;
            padding: 1.375rem 2.25rem 1.375rem 2.25rem;
            border: 1px solid #ffffff;
            border-radius: 32px;
            background-color: transparent;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.875rem;
            line-height: 0;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-outline-reg:hover {
            border: 1px solid #ffffff;
            background-color: #ffffff;
            color: #ffffff;
            text-decoration: none;
        }

        .btn-outline-lg {
            display: inline-block;
            padding: 1.625rem 2.625rem 1.625rem 2.625rem;
            border: 1px solid #ffffff;
            border-radius: 32px;
            background-color: transparent;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.875rem;
            line-height: 0;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-outline-lg:hover {
            border: 1px solid #ffffff;
            background-color: #ffffff;
            color: #ffffff;
            text-decoration: none;
        }

        .btn-outline-sm {
            display: inline-block;
            padding: 1rem 1.625rem 1rem 1.625rem;
            border: 1px solid #ffffff;
            border-radius: 32px;
            background-color: transparent;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.875rem;
            line-height: 0;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-outline-sm:hover {
            border: 1px solid #ffffff;
            background-color: #ffffff;
            color: #ffffff;
            text-decoration: none;
        }

        .form-group {
            position: relative;
            margin-bottom: 1.25rem;
        }

        .label-control {
            position: absolute;
            top: 1rem;
            left: 2rem;
            color: #585f63;
            opacity: 1;
            font-size: 0.875rem;
            line-height: 1.375rem;
            cursor: text;
            transition: all 0.2s ease;
        }

        .form-control-input:focus + .label-control,
        .form-control-input.notEmpty + .label-control,
        .form-control-textarea:focus + .label-control,
        .form-control-textarea.notEmpty + .label-control {
            top: 0.125rem;
            opacity: 1;
            font-size: 0.75rem;
            font-weight: 700;
        }

        .form-control-input,
        .form-control-select {
            display: block; /* needed for proper display of the label in Firefox, IE, Edge */
            width: 100%;
            padding-top: 1.125rem;
            padding-bottom: 0.375rem;
            padding-left: 1.875rem;
            border: 1px solid #c4d8dc;
            border-radius: 32px;
            background-color: #ffffff;
            color: #30363a;
            font-size: 0.875rem;
            line-height: 1.875rem;
            transition: all 0.2s;
            -webkit-appearance: none; /* removes inner shadow on form inputs on ios safari */
        }

        .form-control-select {
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            height: 3rem;
        }

        select {
            /* you should keep these first rules in place to maintain cross-browser behavior */
            -webkit-appearance: none;
            -moz-appearance: none;
            -ms-appearance: none;
            -o-appearance: none;
            appearance: none;
            background-image: url('../images/down-arrow.png');
            background-position: 96% 50%;
            background-repeat: no-repeat;
            outline: none;
        }

        .form-control-textarea {
            display: block; /* used to eliminate a bottom gap difference between Chrome and IE/FF */
            width: 100%;
            height: 14rem; /* used instead of html rows to normalize height between Chrome and IE/FF */
            padding-top: 1.5rem;
            padding-left: 1.875rem;
            border: 1px solid #c4d8dc;
            border-radius: 0;
            background-color: #ffffff;
            color: #30363a;
            font-size: 0.875rem;
            line-height: 1.5rem;
            transition: all 0.2s;
        }

        .form-control-input:focus,
        .form-control-select:focus,
        .form-control-textarea:focus {
            border: 1px solid #a1a1a1;
            outline: none; /* removes blue border on focus */
        }

        .form-control-input:hover,
        .form-control-select:hover,
        .form-control-textarea:hover {
            border: 1px solid #a1a1a1;
        }

        .checkbox {
            font-size: 0.75rem;
            line-height: 1.25rem;
        }

        input[type='checkbox'] {
            vertical-align: -10%;
            margin-right: 0.5rem;
        }

        .form-control-submit-button {
            display: inline-block;
            width: 100%;
            height: 3.5rem;
            border: 1px solid #a91265;
            border-radius: 32px;
            background-color: #a91265;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.875rem;
            line-height: 0;
            cursor: pointer;
            transition: all 0.2s;
        }

        .form-control-submit-button:hover {
            border: 1px solid #ffffff;
            background-color: transparent;
            color: #ffffff;
        }


        /******************/
        /*     Header     */
        /******************/
        .header {
            position: relative;
            min-height: 100%;
            padding-top: 3rem;
            background-color: #330000;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 800 400'%3E%3Cdefs%3E%3CradialGradient id='a' cx='396' cy='281' r='514' gradientUnits='userSpaceOnUse'%3E%3Cstop offset='0' stop-color='%23D18'/%3E%3Cstop offset='1' stop-color='%23330000'/%3E%3C/radialGradient%3E%3ClinearGradient id='b' gradientUnits='userSpaceOnUse' x1='400' y1='148' x2='400' y2='333'%3E%3Cstop offset='0' stop-color='%23FA3' stop-opacity='0'/%3E%3Cstop offset='1' stop-color='%23FA3' stop-opacity='0.5'/%3E%3C/linearGradient%3E%3C/defs%3E%3Crect fill='url(%23a)' width='800' height='400'/%3E%3Cg fill-opacity='0.4'%3E%3Ccircle fill='url(%23b)' cx='267.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='532.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='400' cy='30' r='300'/%3E%3C/g%3E%3C/svg%3E");
            background-size: cover;
            background-position: center;
            text-align: center;
        }

        .header .logo-image {
            display: block;
            width: 120px;
            margin-right: auto;
            margin-bottom: 1.75rem;
            margin-left: auto;
            opacity: 0.8;
        }

        .header .logo-text {
            display: block;
            margin-bottom: 2rem;
            color: #ffffff;
            opacity: 0.8;
            font-weight: 700;
            font-size: 3rem;
            text-decoration: none;
        }

        .header .countdown {
            margin-bottom: 1rem;
            text-align: center;
        }

        .header .countdown #clock .counter-number {
            display: inline-block;
            width: 6.5rem;
            height: 6.5rem;
            margin-right: 0.5rem;
            margin-bottom: 1.25rem;
            margin-left: 0.5rem;
            padding-top: 2rem;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            font-weight: 700;
            font-size: 2.25rem;
            line-height: 1.25rem;
        }

        .header .countdown #clock .counter-number .timer-text {
            color: #ffffff;
            font-weight: 400;
            font-size: 0.75rem;
            line-height: 1rem;
        }

        .header .text-container {
            margin-bottom: 12rem;
        }

        .header h1 {
            margin-bottom: 0.875rem;
        }

        .header .p-large {
            margin-bottom: 2.75rem;
        }

        .header .social-container {
            position: absolute;
            right: 0;
            bottom: 1rem;
            left: 0;
        }

        .header .fa-stack {
            width: 2em;
            margin-bottom: 0.75rem;
            margin-right: 0.375rem;
            font-size: 1.25rem;
        }

        .header .social-container .fa-stack:last-child {
            margin-right: 0;
        }

        .header .fa-stack .fa-stack-1x {
            color: #a91265;
            transition: all 0.2s ease;
        }

        .header .fa-stack .fa-stack-2x {
            color: #ffffff;
            opacity: 0.8;
            transition: all 0.2s ease;
        }

        .header .fa-stack:hover .fa-stack-2x {
            opacity: 1;
        }


        /*************************/
        /*     Media Queries     */
        /*************************/
        /* Min-width 768px */
        @media (min-width: 768px) {

            /* General Styles */
            h1 {
                font-size: 3rem;
                line-height: 3.75rem;
            }
            /* end of general styles */


            /* Header */
            .header {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                padding-top: 0;
            }

            .header .text-container {
                margin-bottom: 6rem;
            }

            .header .countdown {
                margin-bottom: 3rem;
            }

            .header .countdown #clock .counter-number {
                width: 7.75rem;
                height: 7.75rem;
                margin-bottom: 0;
                padding-top: 2.5rem;
                font-size: 3rem;
                line-height: 1.5rem;
            }

            .header .countdown #clock .counter-number .timer-text {
                font-size: 0.875rem;
                line-height: 1.25rem;
            }

            .header .form-group {
                max-width: 22rem;
                display: inline-block;
                vertical-align: top;
            }

            .header .form-control-input {
                width: 22rem;
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
            }

            .header .form-control-submit-button {
                width: 10rem;
                margin-left: -0.375rem;
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;
            }
            /* end of header */
        }
        /* end of min-width 768px */


        /* Min-width 992px */
        @media (min-width: 992px) {

            /* Header */
            .header .countdown #clock .counter-number {
                width: 9rem;
                height: 9rem;
                padding-top: 3.125rem;
                font-size: 3.25rem;
            }

            .header .text-container {
                width: 872px;
                margin-right: auto;
                margin-left: auto;
            }
            /* end of header */
        }
        /* end of min-width 992px */


        /* Min-width 1200px */
        @media (min-width: 1200px) {

            /* Header */
            .header h1 {
                font-size: 3.625rem;
                line-height: 4.5rem;
                letter-spacing: -0.4px;
            }
            /* end of header */
        }
        /* end of min-width 1200px */
    </style>
</head>
<body>

<!-- Header -->
<header id="header" class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="text-container">
                    <div class="countdown">
                        <span id="clock"></span>
                    </div> <!-- end of countdown -->

                    <h1>Project Coming Soon</h1>
                    <p class="p-large">We love to create dependable business solutions for companies of all sizes and any industry. Our goal is to improve accuracy and efficiency to reduce operational costs</p>

                    <!-- Sign Up Form -->
                    <form id="signUpForm">
                        <div class="form-group">
                            <input type="email" class="form-control-input" id="semail" required>
                            <label class="label-control" for="semail">Email address</label>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="form-control-submit-button">SIGN UP</button>
                        </div>
                    </form>
                    <!-- end of sign up form -->

                </div> <!-- end of text-container -->
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->

    <!-- Social Links -->
    <div class="social-container">

        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="logo-text" href="index.html">Petals</a> -->

        <!-- Image Logo -->
        <a href="index.html"><img class="logo-image" src="images/logo.svg" alt="alternative"></a>

        <span class="fa-stack">
                <a href="#your-link">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-facebook-f fa-stack-1x"></i>
                </a>
            </span>
        <span class="fa-stack">
                <a href="#your-link">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-twitter fa-stack-1x"></i>
                </a>
            </span>
        <span class="fa-stack">
                <a href="#your-link">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-pinterest-p fa-stack-1x"></i>
                </a>
            </span>
        <span class="fa-stack">
                <a href="#your-link">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-instagram fa-stack-1x"></i>
                </a>
            </span>
        <span class="fa-stack">
                <a href="#your-link">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-linkedin-in fa-stack-1x"></i>
                </a>
            </span>
    </div> <!-- end of social-container -->
    <!-- end of social links -->

</header> <!-- end of header -->
<!-- end of header -->


<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js" integrity="sha512-0QbL0ph8Tc8g5bLhfVzSqxe9GERORsKhIn1IrpxDAgUsbBGz/V7iSav2zzW325XGd1OMLdL4UiqRJj702IeqnQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.1.0/js/jquery.countdown.min.js" integrity="sha512-+Cdr05lT+aP+PTW4988XKLMjoAf0o5P2nRDIHooD/NItysfsyCPPhZhK/C6s7ZpaVoMRtsvRNJLtYOTDANC5UA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

    (function($) {
        "use strict";

        /* Move Form Fields Label When User Types */
        // for input and textarea fields
        $("input, textarea").keyup(function(){
            if ($(this).val() != '') {
                $(this).addClass('notEmpty');
            } else {
                $(this).removeClass('notEmpty');
            }
        });


        /* Countdown Timer - The Final Countdown */
        $('#clock').countdown('2021/12/27 08:50:56') /* change here your "countdown to" date */
            .on('update.countdown', function(event) {
                var format = '<span class="counter-number">%D<br><span class="timer-text">Days</span></span><span class="counter-number">%H<br><span class="timer-text">Hours</span></span><span class="counter-number">%M<br><span class="timer-text">Minutes</span></span><span class="counter-number">%S<br><span class="timer-text">Seconds</span></span>';
                $(this).html(event.strftime(format));
            })
            .on('finish.countdown', function(event) {
                $(this).html('This offer has expired!')
                    .parent().addClass('disabled');
            });


        /* Removes Long Focus On Buttons */
        $(".button, a, button").mouseup(function() {
            $(this).blur();
        });

    })(jQuery);
</script> <!-- Custom scripts -->
</body>
</html>
