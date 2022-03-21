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
