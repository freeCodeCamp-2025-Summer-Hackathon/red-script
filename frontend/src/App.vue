<template>
  <div>
    <LoginPage @registrationSubmitted="handleRegistrationSubmitted"/>
    <!-- <div>
      <h1>Users</h1>
      <ul>
        <li v-for="user in users" :key="user.id">
          <strong>{{ user.name ?? "—" }}</strong>
          <span>({{ user.email }})</span>
        </li>
      </ul>
      <p v-if="error">Error: {{ error }}</p>
    </div> -->
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";
// import { useToast } from 'vue-toastification';
import LoginPage from "./pages/LoginPage.vue";
interface User {
  id: number;
  email: string;
  name?: string;
}

const users = ref<User[]>([]);
const error = ref<string | null>(null);



// const toast = useToast();

// sample data
// const registrationInfo = {
//   email: "test6@example.com",
//   password: "superSecure123!",
//   username: "JohnSmith6",
//   fullName: "John Smith",

//   timezoneOffset: -240, // for example, UTC-4
//   zip: "44114",
//   city: "Cleveland",
//   state: "Ohio",
//   country: 1,

//   latitude: 41.4993,
//   longitude: -81.6944
// }

const handleRegistrationSubmitted = (registrationData: Object) =>{
  try {
  //console.log(registrationData)
let token = '';
fetch("https://localhost:4000/api/auth/register", {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify(registrationData)

})
  .then(response => response.json())
  .then(data => {token=data});

  // if (registrationData.password.length<8) {
  //   toast.error("Password must be at least 8 characters!")
  // }
  // if (registrationData.username.length<3) {
  //   toast.error("Username must be at least 3 characters!")
  // }
  
  
} catch (e: any) {
    error.value = e.message;
    console.error(e);
    // toast.error("Registration Error!");
  }
}




onMounted(async () => {
  
//   try {
    
      
// //     const payload = {
// //   email: "test@example.com",
// //   password: "superSecure123!",
// //   username: "JohnSmith",
// //   fullName: "John Smith",

// //   timezoneOffset: -240, // for example, UTC-4
// //   zip: "44114",
// //   city: "Cleveland",
// //   state: "Ohio",
// //   country: 1,

// //   latitude: 41.4993,
// //   longitude: -81.6944
// // };
// // let token = '';
// // const res = fetch("https://localhost:4000/api/auth/register", {
// //   method: "POST",
// //   headers: {
// //     "Content-Type": "application/json"
// //   },
// //   body: JSON.stringify(payload)

// // })
// //   .then(response => response.json())
// //   .then(data => {token=data})
// //   .catch(error => console.error("Error:", error));

//   const loginpayload= {
//     email: "test@example.com",
//     password: "superSecure123!",
//   }
//   let token2=''
//   fetch("https://localhost:4000/api/auth/login", {
// method: "POST", 
// headers: {
//     "Content-Type": "application/json"
//   },
//   body: JSON.stringify(loginpayload),
//   })
//   .then(response => response.json())
//   .then(data => {token2=data})
//   .catch(error => console.error("Error:", error));
//     // const res = await fetch("https://localhost:4000/api/auth/register");
//     // if (!res.ok) throw new Error(Status ${res.status});
//     // users.value = await res.json();
    
//     //toast.success("Login Successful!")

//   } catch (e: any) {
//     error.value = e.message;
//     console.error(e);
//   }
});
</script>

<style scoped lang="scss"></style>
