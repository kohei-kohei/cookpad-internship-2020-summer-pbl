<template>
  <div id="nav" class="flex">
    <h2 @click="goTop">体を作る</h2>

    <button class="login" @click="onLogin" v-if="true">ログイン</button>
    <button class="logout" @click="onLogout" v-if="false">ログアウト</button>
    <i class="el-icon-user-solid" @click="goPersonal"></i>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: "takuma",
    };
  },
  methods: {
    goTop() {
      if (this.$route.path !== "/") {
        this.$router.push({ path: "/" });
      }
    },
    onLogin() {
      if (this.$route.path !== "/login") {
        this.$router.push({ path: "/login" });
      }
    },
    onLogout() {
    //   this.$store.commit("loginUser", "");
      if (this.$route.path !== "/") {
        this.$router.push({ path: "/" });
      }
    },
    goPersonal() {
      if (this.username === "") {
        if (this.$route.path !== "/register") {
          this.$router.push({ path: "/register" });
        }
      } else {
        if (this.$route.path !== "/personalpage") {
          this.$router.push({ path: "/personalpage" });
        }
      }
    },
  },
};
</script>

<style scoped>
#nav {
  background-color: #ff7b7b;
  margin: 0 auto;
  padding: 10px 180px;
  text-align: center;
  position: relative;
}
.el-icon-user-solid {
  font-size: 36px;
}
.flex {
  display: flex;
  align-items: center;
}
h2 {
  font-size: 32px;
  margin: 10px auto 10px 0;
  font-weight: normal;
}
button {
  appearance: none;
  border: none;
  border-radius: 6px;
  background-color: #bebebe;
  cursor: pointer;
  margin-right: 50px;
  outline: none;
  padding: 8px 16px;
}
.login {
  background-color: rgb(184, 184, 184);
  margin-right: 40px;
  padding: 8px;
  width: 100px;
}
.logout {
  background-color: rgb(255, 155, 40);
  margin-right: 40px;
  padding: 8px;
  width: 100px;
}
</style>
