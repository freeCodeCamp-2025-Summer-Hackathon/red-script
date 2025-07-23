import {TradeRequests} from './TradeRequests'
import {Reviews} from './Reviews'

export type Swaps = {
    id: number,
    guid: number,
    startOn: Date,
    endOn: Date | null,
    tradeRequestId: number,
    statusId: number,
    tradeRequest: TradeRequests,
    status: SwapStatuses,
    reviews: Reviews[]
}

export type SwapStatuses = {
    id: number,
    guid: string,
    name: string,
    swaps: Swaps[],
}