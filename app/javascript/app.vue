<template>
  <div id="app">
    <Nav></Nav>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from "vue";
import VueRouter from "vue-router";
import ElementUI from "element-ui";
import locale from "element-ui/lib/locale/lang/ja";
import "element-ui/lib/theme-chalk/index.css";
import "element-ui/lib/theme-chalk/display.css";

Vue.use(ElementUI, { locale });
Vue.use(VueRouter);

import Top from "Top.vue";
import Nav from "Nav.vue";
import PersonalPage from "PersonalPage.vue";
import Login from "Login.vue";

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Top },
    { path: "/personalpage", component: PersonalPage },
    { path: "/login", component: Login },
  ],
});

export default {
  router,
  components: {
    Nav,
  },
};
</script>

<style scoped>
</style>
