<template>
  <form class="w-full max-w-md flex flex-col p-10 gap-4" @submit.prevent="onSubmit">

    <fieldset class="rounded-md">
      <legend class="text-sm font-medium text-gray-700 mb-4">
        Profile Details
      </legend>
      <div class="flex flex-col gap-4">

        <input
          name="name"
          type="text"
          v-model="name"
          placeholder="Full name"
          required
          aria-label="enter full name"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
   
        <input
          name="username"
          type="text"
          v-model="username"
          placeholder="Username"
          required
          aria-label="create username"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />

        <input
          name="email"
          type="email"
          v-model="email"
          placeholder="Email"
          required
          aria-label="create email"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          name="password"
          type="password"
          v-model="password"
          placeholder="Password"
          required
          aria-label="create password"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </fieldset>


    <fieldset class="rounded-md">
      <div class="flex items-center justify-between mb-4">
        <legend class="text-sm font-medium text-gray-700">Location</legend>
        <!-- <button
          type="button"
          class="text-xs text-blue-600 hover:text-blue-800 underline"
          @click="getCurrentLocation"
          aria-label="Click here to use current location from browser"
        >
          Use Current Location
        </button> -->
      </div>
      <div class="flex flex-col gap-4">
        <input
          name="city"
          type="text"
          v-model="city"
          placeholder="City"
          required
          aria-label="Enter city"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          name="state"
          type="text"
          id="state"
          v-model="state"
          placeholder="State"
          required
          aria-label="Enter state"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- <input
          name="country"
          type="number"
          v-model="country"
          placeholder="Country"
          required
          aria-label="Enter country code"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        /> -->
        <input
          name="zip"
          type="text"
          v-model="zip"
          placeholder="ZIP"
          required
          aria-label="Enter zip"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </fieldset>

    <div class="flex gap-4 mt-2">
      <button
        type="button"
        class="flex-1 border border-blue-500 text-blue-500 rounded-full py-2 font-medium hover:bg-blue-50 transition"
        @click="$emit('toggleForm')"
        aria-label="go back to sign in button"
      >
        Back to Sign In
      </button>
      <button
        class="flex-1 bg-green-600 text-white rounded-full py-2 font-medium hover:bg-green-700 transition"
        aria-label="create account button"
      >
        Register
      </button>
    </div>
  </form>
</template>
<script setup lang="ts">
import {ref} from 'vue';
// import {useToast} from 'vue-toastification';
const name=ref('');
const username=ref('');
const email=ref('');
const password=ref('');
const city=ref('');
const state=ref('');
//const country=ref('');
const zip=ref('');

const emit = defineEmits(['toggleForm','registrationSubmitted'])


// sample data:
// const registrationInfo = ref({
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
// })
// const toast = useToast();
const onSubmit = () => {
  const registrationData = {
  fullName: name.value,
  username: username.value,
  email: email.value,
  password: password.value,
  city: city.value,
  state: state.value,
  country: 1,
  zip: zip.value,
  
  //function to find next items is not implemented
  timezoneOffset: 0,
  latitude: 0,
  longitude: 0,
  };
  emit('registrationSubmitted', registrationData)
}
const getCurrentLocation = () => {};
</script>
