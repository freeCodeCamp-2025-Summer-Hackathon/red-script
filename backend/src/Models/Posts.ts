import {Users} from './Users'
import {PostTypes} from './PostTypes'
import {PostOffers} from './PostOffers'
import {PostWants} from './PostWants'
import {PostTags} from './PostTags'
import {TradeRequests} from './TradeRequests'

export type Posts = {
    id: number,
    guid: string,
    title: string,
    description: string,
    radius: number,
    isActive: boolean,
    createdOn: Date,
    updatedOn: Date,
    typeId: number,
    userID: number,
    user: Users,
    type: PostTypes,
    offers: PostOffers,
    wants: PostWants,
    tags: PostTags,
    tradeRequests: TradeRequests,
}