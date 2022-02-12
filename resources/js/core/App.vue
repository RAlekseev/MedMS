<template>
    <div>
        <div id="wrapper">
            <SideBar></SideBar>

            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <NavBar></NavBar>

                    <div class="container-fluid">
                        <div v-for="message in messages"><Message  :message="message"></Message></div>
                        <div v-for="error in errors"><Error  :error="error"></Error></div>

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
        import Message from './components/Message';
        import Error from './components/Error';

        import { mapGetters } from 'vuex'


        export default {
            computed: {
                ...mapGetters([
                    'errors',
                    'messages'
                ])
            },
            components: {
                NavBar,
                SideBar,
                Footer,
                Message,
                Error
            }
        }
    </script>
