import {Posts} from './Posts'
import {Tags} from './Tags'

export type PostTags = {
    id: number,
    postId: number,
    tagId: number,
    post: Posts,
    tag: Tags,
}