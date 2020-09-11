<template>
  <div id="register">
    <p>会員登録</p>
    <el-form ref="form" :model="form" label-width="120px">
      <el-form-item label="名前">
        <el-input v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="性別">
        <el-input v-model="form.gender"></el-input>
      </el-form-item>
      <el-form-item label="年齢">
        <el-input v-model="form.age"></el-input>
      </el-form-item>
      <el-form-item label="体重">
        <el-input v-model="form.weight"></el-input>
      </el-form-item>
      <el-form-item label="メールアドレス">
        <el-input v-model="form.email"></el-input>
      </el-form-item>
      <el-form-item label="パスワード">
        <el-input v-model="form.password"></el-input>
      </el-form-item>
      <el-form-item label="再パスワード">
        <el-input v-model="form.repassword"></el-input>
      </el-form-item>
      <el-button type="warning" @click="onRegister">登録する</el-button>
    </el-form>
    <router-link to="/login">ログインはこちら</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: "",
        gender: "",
        age: "",
        weight: "",
        email: "",
        password: "",
        repassword: "",
      },
    };
  },
  methods: {
    onRegister() {
      this.$router.push({ path: "/login" });
    },
  },
};
</script>

<style scoped>
#register {
  text-align: center;
  margin: 50px;
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
  width: 420px;
}
</style>
