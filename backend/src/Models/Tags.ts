import {PostTags} from './PostTags'
export type Tags = {
    id: number,
    guid: string,
    name: string,
    parentTagId: number | null,
    parent: Tags,
    children: Tags[],
    posts: PostTags[]
}