<template>
  <div id="login">
    <p>ログインフォーム</p>
    <el-form ref="form" :model="form" label-width="100px">
      <el-form-item label="名前">
        <el-input v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="パスワード">
        <el-input v-model="form.password"></el-input>
      </el-form-item>
      <el-button type="primary" @click="onLogin">ログイン</el-button>
    </el-form>
    <router-link to="/register">会員登録はこちら</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: "",
        password: "",
      },
    };
  },
  methods: {
    onLogin() {
      this.$router.push({ path: "/" });
    },
  },
};
</script>

<style scoped>
#login {
  text-align: center;
  margin-bottom: 50px;
}
p {
  font-size: 24px;
  text-align: center;
}
.el-button {
  display: block;
  margin: 0 auto;
}
.el-form {
  border: 1px solid #606266;
  border-radius: 8px;
  padding: 40px;
  margin: 0 auto;
  width: 400px;
}
</style>
