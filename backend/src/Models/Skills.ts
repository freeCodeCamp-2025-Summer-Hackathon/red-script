import {PostOffers} from './PostOffers'
import {PostWants} from './PostWants'
import {Reviews} from './Reviews'

export type Skills = {
    id: number,
    guid: number,
    name: string,
    parentSkillId: number,
    parent: Skills,
    childrent: Skills[],
    offeredPosts: PostOffers[],
    wantedPosts: PostWants[],
    reviews: Reviews[]
}