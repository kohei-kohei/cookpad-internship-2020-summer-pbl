<template>
  <div id="top">
    <p>トップページ</p>

    <p>今日の食事</p>
    <el-card :body-style="{ padding: '0px' }">
      <img
        src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
        class="image"
      />
      <div style="padding: 14px;">
        <span>ハンバーガー</span>
      </div>
    </el-card>
    <el-card :body-style="{ padding: '0px' }" @click="openModal">
      <i class="el-icon-circle-plus-outline"></i>
    </el-card>

    <p>今日の運動</p>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>time</th>
        </tr>
        <tr v-for="e in exercises" :key="e.id">
          <td>{{ e.id }}</td>
          <td>{{ e.name }}</td>
          <td>{{ e.time }}</td>
        </tr>
      </tbody>
    </table>

    <el-button type="warning">レシピの提案</el-button>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      exercises: [],
    };
  },
  mounted() {
    axios.get("/api/v1/exercises.json").then((response) => {
      this.exercises = response.data;
    });
  },
  methods: {
    openModal() {
      this.$prompt("何を食べたか入力してね！", "入力フォーム", {
        confirmButtonText: "OK",
        cancelButtonText: "Cancel",
        // inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
        // inputErrorMessage: "Invalid Email",
      })
        .then(({ value }) => {
          this.$message({
            type: "success",
            // message: "Your email is:" + value,
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            // message: "Input canceled",
          });
        });
    },
  },
};
</script>

<style scoped>
p {
  font-size: 24px;
  text-align: center;
}
table {
  margin: 0 auto;
}
</style>
