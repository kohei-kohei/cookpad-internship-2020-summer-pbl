<template>
  <div class="card">
    <img :src="url" :alt="title" />
    <p>{{ title }} {{ time }}分</p>
    <p>{{ momentum }}kcal</p>
  </div>
</template>

<script>
export default {
  props: {
    id: {
      type: Number,
    },
    url: {
      type: String,
      default:
        "https://d3ilon0y191ut0.cloudfront.net/wp-content/uploads/2019/10/28162821/mens-running.jpeg",
    },
    title: {
      type: String,
      default: "タイトル",
    },
    time: {
      type: Number,
    },
    momentum: {
      type: Number,
      default: 100,
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
img {
  width: 100%;
  height: 200px;
  border-radius: 8px 8px 0 0;
}
</style>
