import {Posts} from './Posts'
import {Users} from './Users'
import {Swaps} from './Swaps'
import {Conversations} from './Conversations'

export type TradeRequests = {
    id: number,
    guid: number,
    createdOn: Date,
    respondedOn: Date,
    isActive: boolean,
    postId: number,
    fromUserId: number,
    statusId: number,
    post: Posts,
    fromUser: Users,
    status: TradeRequestsStatuses
    swap: Swaps,
    converstation: Conversations,
}

export type TradeRequestsStatuses = {
    id: number,
    guid: string,
    name: string,
    requests: TradeRequests[]
}