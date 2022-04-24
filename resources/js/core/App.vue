<template>
    <div>
        <div id="wrapper">
            <SideBar v-if="isLogged"></SideBar>

            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <NavBar></NavBar>
                    <div v-for="message in messages"><Message  :message="message"></Message></div>
                    <div v-for="error in errors"><Error  :error="error"></Error></div>
                    <Loading v-if="loading"></Loading>

                        <router-view></router-view>
                </div>

                <Footer></Footer>
            </div>

        </div>
    </div>
</template>

    <!-- Scroll to Top Button-->

    <script>
        import SideBar from './components/SideBar';
        import NavBar from './components/NavBar';
        import Footer from './components/Footer';
        import Message from './components/Message';
        import Error from './components/Error';
        import Loading from './components/Loading';

        import { mapGetters } from 'vuex'


        export default {
            computed: {
                ...mapGetters([
                    'isLogged',
                    'errors',
                    'messages',
                    'loading',
                ])
            },
            mounted() {

                $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
                    $("body").toggleClass("sidebar-toggled");
                    $(".sidebar").toggleClass("toggled");
                    if ($(".sidebar").hasClass("toggled")) {
                        $('.sidebar .collapse').collapse('hide');
                    };
                });

                // Close any open menu accordions when window is resized below 768px
                $(window).resize(function() {
                    if ($(window).width() < 768) {
                        $('.sidebar .collapse').collapse('hide');
                    };

                    // Toggle the side navigation when window is resized below 480px
                    if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
                        $("body").addClass("sidebar-toggled");
                        $(".sidebar").addClass("toggled");
                        $('.sidebar .collapse').collapse('hide');
                    };
                });

                // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
                $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
                    if ($(window).width() > 768) {
                        var e0 = e.originalEvent,
                            delta = e0.wheelDelta || -e0.detail;
                        this.scrollTop += (delta < 0 ? 1 : -1) * 30;
                        e.preventDefault();
                    }
                });

                // Scroll to top button appear
                $(document).on('scroll', function() {
                    var scrollDistance = $(this).scrollTop();
                    if (scrollDistance > 100) {
                        $('.scroll-to-top').fadeIn();
                    } else {
                        $('.scroll-to-top').fadeOut();
                    }
                });

                // Smooth scrolling using jQuery easing
                $(document).on('click', 'a.scroll-to-top', function(e) {
                    var $anchor = $(this);
                    $('html, body').stop().animate({
                        scrollTop: ($($anchor.attr('href')).offset().top)
                    }, 1000, 'easeInOutExpo');
                    e.preventDefault();
                });
            },

            components: {
                NavBar,
                SideBar,
                Footer,
                Message,
                Error,
                Loading,
            },
        }
    </script>
