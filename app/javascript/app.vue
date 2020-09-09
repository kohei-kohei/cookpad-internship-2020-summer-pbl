<template>
  <div id="app">
    <p>{{ message }}</p>

    <p>今日の食事</p>

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
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      message: "Hello Rails&Vue!",
      exercises: [],
    };
  },
  created() {
    axios.get("/api/v1/exercises.json").then((response) => {
      this.exercises = response.data;
    });
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
table {
  margin: 0 auto;
}
</style>
