import {Posts} from './Posts'
import {Skills} from './Skills'

export type  PostWants = {
    id: number,
    guid: string,
    postId: number,
    skillId: number,
    orderNum: number,
    post: Posts,
    skill: Skills
}