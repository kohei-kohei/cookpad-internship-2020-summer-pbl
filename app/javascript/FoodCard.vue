<template>
  <div class="card">
    <img :src="url" :alt="title" />
    <p>{{ title }} {{ volume }}</p>
    <p>{{ nutrition }}</p>
  </div>
</template>

<script>
export default {
  props: {
    url: {
      type: String,
    },
    title: {
      type: String,
      default: "タイトル",
    },
    volume: {
      type: String,
    },
    nutrition: {
      type: String,
    },
  },
};
</script>

<style scoped>
.card {
  background-color: #fff;
  text-align: center;
  border: 1px solid #aaa;
  border-radius: 8px !important;
  width: calc(33.33333% - 42px);
  margin: 20px;
}
.flex {
  display: flex;
  align-items: center;
}
p {
  pointer-events: none;
}
img {
  pointer-events: none;
  width: 100%;
  height: 200px;
  border-radius: 8px 8px 0 0;
}
</style>
