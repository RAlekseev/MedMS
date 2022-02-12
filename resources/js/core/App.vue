<template>
    <div>
        <div id="wrapper">
            <SideBar></SideBar>

            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <NavBar></NavBar>

                    <div class="container-fluid">
                        <router-view></router-view>
                    </div>
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

        export default {
            components: {
                NavBar,
                SideBar,
                Footer,
            }
        }
    </script>
