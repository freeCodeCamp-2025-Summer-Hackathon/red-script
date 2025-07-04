<template>
  <div>
    <LoginPage />
    <div>
      <h1>Users</h1>
      <ul>
        <li v-for="user in users" :key="user.id">
          <strong>{{ user.name ?? "—" }}</strong>
          <span>({{ user.email }})</span>
        </li>
      </ul>
      <p v-if="error">Error: {{ error }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";
import LoginPage from "./pages/LoginPage.vue";
interface User {
  id: number;
  email: string;
  name?: string;
}

const users = ref<User[]>([]);
const error = ref<string | null>(null);

onMounted(async () => {
  try {
    const res = await fetch("http://localhost:4000/api/users");
    if (!res.ok) throw new Error(`Status ${res.status}`);
    users.value = await res.json();
  } catch (e: any) {
    error.value = e.message;
    console.error(e);
  }
});
</script>

<style scoped lang="scss"></style>
