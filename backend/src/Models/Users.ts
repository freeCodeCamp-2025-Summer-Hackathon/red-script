export type Users = {
    id: number,
    guid: string,
    email: string,
    username: string,
    fullName: string,
    password: string,
    isActive: boolean,
    bio: string | null
    timezoneOffset: number | null,
    latiture: number | null,
    longitude: number | null,
    zip: string | null,
    city: string | null,
    state: string | null,
    country: number,
    createdAt: Date,
}